class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  after_create :send_friendship_asking_email

  private

  def send_friendship_asking_email
    user = User.find(self.user_id)
    target = User.find(self.friend_id)
    UserMailer.ask_for_friendship(user, target).deliver_now
  end

end
