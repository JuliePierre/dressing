class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :outfits, dependent: :destroy
  has_many :proposals, dependent: :destroy
  has_many :ceremonies
  has_many :dressing_items, dependent: :destroy

  # Logique de réseau social : many to many relations entre les users, table de jointure = friendships
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  validates :first_name, presence: true
  validates :last_name, presence: true

  acts_as_voter

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def all_friends_ids
    user_friends_ids = []
    user_friends = self.friendships.where("is_accepted = ?", true)
    user_friends.each do |friendship|
      user_friends_ids << friendship.friend_id
    end
    user_friends_inverse = self.inverse_friendships.where("is_accepted = ?", true)
    user_friends_inverse.each do |friendship|
      user_friends_ids << friendship.user_id
    end
    return user_friends_ids
  end

  def accepted_friends
    accepted_friends = []
    self.all_friends_ids.each do |id|
      accepted_friends << Friend.find(id)
    end
    return accepted_friends
  end

  def friendship_invitations
    self.friendships.where("is_accepted": nil)
  end

  def friendship_requests
    self.inverse_friendships.where("is_accepted": nil)
  end

  def friend_invitations
    friend_invitations = []
    self.friendship_invitations.each do |friendship|
      friend_invitations << Friend.find(friendship.friend_id)
    end
    return friend_invitations
  end

  def pending_friend_requests
    pending_friend_requests = []
    self.friendship_requests.each do |friendship|
      pending_friend_requests << Friend.find(friendship.friend_id)
    end
    return pending_friend_requests
  end

end
