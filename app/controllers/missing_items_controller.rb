class MissingItemsController < ApplicationController

  def new
    @missing_item = MissingItem.new
  end

  def create
    @missing_item = MissingItem.new(missing_item_params)
    @missing_item.status = "Pending"
    @missing_item.user = current_user
    if @missing_item.save
      params["missing_item"]["photos"].each do |photo|
        picture = MissingItemPicture.new(missing_item: @missing_item)
        picture.photo = photo
        picture.save
      end
      redirect_to dashboard_user_path(current_user)
    else
      render :new
    end
  end

  private

  def missing_item_params
    params.require(:missing_item).permit(:name, :description, :ref, :photos)
  end

end
