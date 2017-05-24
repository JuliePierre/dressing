class DressingItemsController < ApplicationController

  def new
    @dressing_item = DressingItem.new
  end

  def create
    @dressing_item = DressingItem.new(dressing_items_params)
    @dressing_item.user = current_user

    if params[:dressing_item][:photos].nil?
      urls = []
      Outfit.find(params[:dressing_item][:outfit_id]).photos.each do |photo|
        url = "http://res.cloudinary.com/dmx5zou5e/image/upload/" + photo.path
        urls << url
      end
      @dressing_item.photo_urls = urls
    end

    if @dressing_item.save
      redirect_to dressing_user_path(current_user)
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
    params.require(:dressing_item).permit(:name, :category, photos: [])
  end
end
