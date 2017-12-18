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
    @user = User.find(params[:id])
    @dressing_items = @user.dressing_items.where(nil)
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
    # loans
    @current_loans = []
    current_user.dressing_items.each do |item|
      unless item.loans.status("Current").first.nil?
        @current_loans << item.loans.status("Current")
      end
    end
    @pending_loans = []
    current_user.dressing_items.each do |item|
      unless item.loans.status("Pending").first.nil?
        @pending_loans << item.loans.status("Pending")
      end
    end
    @past_loans = []
    current_user.dressing_items.each do |item|
      unless item.loans.status("Past").first.nil?
        @past_loans << item.loans.status("Past")
      end
    end
    # demandes d'aide envoyées
    @item_requests = current_user.missing_items.status("Pending")
    # demandes d'aide reçues --> ce sont les demandes, il faut ensuite remonter à l'item
    @received_requests = MissingItemTarget.where(user_id: current_user.id)
    # modal création de proposition
    @proposal = Proposal.new
  end

  def wishlist
    @items = current_user.find_voted_items
  end

  private

  def filtering_params(params)
    params.slice(:gender, :category)
  end
end
