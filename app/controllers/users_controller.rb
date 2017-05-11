class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_outfits = Outfit.where(" outfits.user_id = ? ", @user.id)
    @user_friends = @user.friendships.where("is_accepted = ?", true)
    @friend_requests = @user.inverse_friends.joins(:friendships).where.not("friendships.is_accepted = ?", true)
    @made_friend_requests = @user.friendships.select do |friendship|
      !friendship.is_accepted
    end
  end
end
