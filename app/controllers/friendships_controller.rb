class FriendshipsController < ApplicationController

  def create
    if current_user.friendships.find_by_friend_id(params[:friend_id])
      flash[:notice] = "Pas possible. Vous êtes déjà amis"
      redirect_to user_path(current_user)
    else
      @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
      if @friendship.save
        respond_to do |format|
          format.html { redirect_to dashboard_user_path(current_user) }
          format.js  # <-- will render `app/views/friendships/create.js.erb`
        end
      else
        respond_to do |format|
          format.html { redirect_to user_path(current_user) }
          format.js  # <-- idem
        end

      end
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.is_accepted = true
    if @friendship.save
      redirect_to users_path
    else
      alert("Nous n'avons pas pu accepter")
    end
    # if @friendship.save
    #   respond_to do |format|
    #     format.html { redirect_to user_path(current_user) }
    #     format.js  # <-- will render `app/views/friendships/update.js.erb`
    #   end
    # else
    #   respond_to do |format|
    #     format.html { redirect_to user_path(current_user) }
    #     format.js  # <-- will render `app/views/friendships/update.js.erb`
    #   end
    # end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end

end
