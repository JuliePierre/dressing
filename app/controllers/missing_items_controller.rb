class MissingItemsController < ApplicationController

  def new
    @missing_item = MissingItem.new
  end

  def create
    @missing_item = MissingItem.new(missing_item_params)
    @missing_item.status = "Pending"
    @missing_item.user = current_user
    if @missing_item.save
      unless params["missing_item_targets"].nil?
        params["missing_item_targets"].each do |id|
          MissingItemTarget.create(user: User.find(id.to_i), missing_item: @missing_item)
        end
      end
      unless params["missing_item"]["photos"].nil?
        params["missing_item"]["photos"].each do |photo|
          picture = MissingItemPicture.new(missing_item: @missing_item)
          picture.photo = photo
          picture.save
        end
      end
      send_request_email
      redirect_to dashboard_user_path(current_user)
    else
      render :new
    end
    # le mail part au create de missing_item (see models/missing_item.rb)
  end

  private

  def missing_item_params
    params.require(:missing_item).permit(:name, :description, :ref, :photos)
  end

  def send_request_email
    @missing_item.missing_item_targets.each do |target|
      UserMailer.send_request(@missing_item.user, target, @missing_item).deliver_now
    end
  end
end
