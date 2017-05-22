class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_outfits = Outfit.where(" outfits.user_id = ? ", @user.id)

    @user_friends = @user.friendships.where("is_accepted = ?", true)
    @user_inverse_friends = @user.inverse_friendships.where("is_accepted = ?", true)

    @friend_requests = @user.inverse_friendships.where("is_accepted": nil)

    @made_friend_requests = @user.friendships.where("is_accepted": nil)

    @user_dressing_items = @user.dressing_items
  end

  def dashboard
    @user = current_user
    @user_outfits = Outfit.where(" outfits.user_id = ? ", @user.id)

    @user_friends = @user.friendships.where("is_accepted = ?", true)
    @user_inverse_friends = @user.inverse_friendships.where("is_accepted = ?", true)

    @friend_requests = @user.inverse_friendships.where("is_accepted": nil)

    @made_friend_requests = @user.friendships.where("is_accepted": nil)
  end
end
