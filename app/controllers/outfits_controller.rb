class OutfitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :new, :create, :update, :upvote]
  before_action :set_outfit, only: [:show, :update, :upvote]

  def show
  end

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user

    if @outfit.save
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  def update
    params[:outfit][:missing_item_ids].delete_at(0)
    @outfit.missing_item_ids = params[:outfit][:missing_item_ids]
    if @outfit.update(outfit_params)
      redirect_to outfit_path(@outfit)
    else
      redirect_to root_path
    end

  end

  def upvote
    if current_user.voted_for? @outfit
      @outfit.unliked_by current_user
    else
      @outfit.liked_by current_user
    end

    if @outfit.save
      respond_to do |format|
        format.html { redirect_to outfit_path(@outfit) }
        format.js  # <-- will render `app/views/outfits/upvote.js.erb`
      end
    else
      respond_to do |format|
        format.js  # <-- will render `app/views/outfits/upvote.js.erb`
      end
    end
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:id])
  end

  def outfit_params
    params.require(:outfit).permit(:name, :occasion, :photo)
  end

end
