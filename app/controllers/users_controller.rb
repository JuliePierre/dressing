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
    #metrics / nombre d'amis
    @user_friends = @user.accepted_friends
    @friend_requests = @user.friendship_requests

    #vide-dressings
    @public_vide_dressings = @user.vide_dressings.where('status = ?', 'Public')
    @private_vide_dressings = @user.vide_dressings.where('status = ?', 'Privé')

    # @user_outfits = Outfit.where(" outfits.user_id = ? ", @user.id)
    # @user_dressing_items = @user.dressing_items
  end

  def dashboard
    # Utilité du dressing = le user gère son compte depuis cette page
    # Il peut gérer :
    # - son compte et ses informations personnelles
    # - son réseau
    # - son dressing : c'est ici qu'il peut ajouter / supprimer des fringues
    # le dressing visible par les autres sera sur la page show d'un user

    @user = current_user
    #@user_outfits = Outfit.where(" outfits.user_id = ? ", @user.id)

    #nouveau dashboard

    # nombre total d'amis
    @actual_friends = @user.accepted_friends

    # pour l'affichage des friend requests : provenant d'autres users
    @pending_requests = @user.pending_friend_requests
    @friendship_requests = @user.friendship_requests

    # pour l'affichage des demandes provenant du current_user encore en attente
    @friend_invitations = @user.friend_invitations
  end

  def dressing
    @dressing = current_user.dressing_items
    # ici c'est mon dressing perso
    # le dressing visible par tous les autres est directement sur la show d'un user dans l'onglet dressing
  end
end
