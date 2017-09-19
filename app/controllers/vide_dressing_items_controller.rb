class VideDressingItemsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @vide_dressing = VideDressing.find(params[:vide_dressing_id])
    @vide_dressing_item = VideDressingItem.new
  end

  def create
    @vide_dressing_item = VideDressingItem.new(vide_dressing_item_params)
    @user = User.find(params[:user_id])
    @vide_dressing = VideDressing.find(params[:vide_dressing_id])
    @vide_dressing_item.vide_dressing = @vide_dressing
    if @vide_dressing_item.save
      redirect_to user_vide_dressing_path(@user, @vide_dressing)
    else
      render :new
    end
  end

  private

  def vide_dressing_item_params
    params.require(:vide_dressing_item).permit(:name, :category, photos: [])
  end
end