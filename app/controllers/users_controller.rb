class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def index
    @users = User.all
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

  def cart

  end
end
