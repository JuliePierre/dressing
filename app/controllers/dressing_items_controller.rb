class DressingItemsController < ApplicationController

  def new
    @dressing_item = DressingItem.new
  end

  def create
    @dressing_item = DressingItem.new(dressing_items_params)
    @dressing_item.user = current_user

    if @dressing_item.save
      redirect_to user_dressing_items_path(current_user)
    else
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @user_dressing = @user.dressing_items
  end


  private

  def dressing_items_params
    params.require(:dressing_item).permit(:name, :category, :photo, :photo_cache)
  end
end
