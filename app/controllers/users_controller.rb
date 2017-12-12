class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def index
    @friends = current_user.accepted_friends
    @friends_ids = []
    @friends.each do |user|
      @friends_ids << user.id
    end
    @friend_invitations = current_user.friend_invitations
    @friend_invitations_ids = []
    @friend_invitations.each do |user|
      @friend_invitations_ids << user.id
    end
    @friend_requests = current_user.pending_friend_requests
    @friend_requests_ids = []
    @friend_requests.each do |user|
      @friend_requests_ids << user.id
    end
    @all_users = User.where.not(id: current_user.id)
    @all_other_users = @all_users.reject { |user| (@friends_ids.include?(user.id) | @friend_invitations_ids.include?(user.id) | @friend_requests_ids.include?(user.id)) }
  end

  def show
    @dressing_items = current_user.dressing_items.where(nil)
    filtering_params(params).each do |key, value|
      if value.present?
        @dressing_items = @dressing_items.public_send(key, value)
      end
    end
    @nb_criteres_filtre = 0
    unless params["gender"].nil?
      @nb_criteres_filtre += params["gender"].size
    end
    unless params["category"].nil?
      @nb_criteres_filtre += params["category"].size
    end
  end

  def dashboard
    # nombre total d'amis
    @actual_friends = current_user.accepted_friends

    # pour l'affichage des friend requests : provenant d'autres users
    @pending_requests = current_user.pending_friend_requests
    # @friendship_requests = current_user.friendship_requests

    # pour l'affichage des demandes provenant du current_user encore en attente
    @friend_invitations = current_user.friend_invitations

    # pour l'affichage du réseau restant
    @not_yet_friends = current_user.not_yet_friends

    # pour l'affichage du dressing
    @dressing_items = current_user.dressing_items

    # wishlist
    @wishlist_items = current_user.find_voted_items

  end

  def wishlist
    @items = current_user.find_voted_items
  end

  private

  def filtering_params(params)
    params.slice(:gender, :category)
  end
end
