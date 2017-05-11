class FriendshipsController < ApplicationController

  def create
    if current_user.friendships.find_by_friend_id(params[:friend_id])
      flash[:notice] = "Pas possible. Vous êtes déjà amis"
      redirect_to user_path(current_user)
    else
      @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
      if @friendship.save
        flash[:notice] = "Added friend."
        redirect_to user_path(current_user)
      else
        flash[:notice] = "Unable to add friend."
        redirect_to user_path(current_user)
      end
    end
  end

  def update
    @friendship = Friendship.find(params[:friendship_id])
    @friendship.is_accepted = true
    if @friendship.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js  # <-- will render `app/views/friendships/update.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js  # <-- will render `app/views/friendships/update.js.erb`
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end

end
