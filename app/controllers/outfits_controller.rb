class OutfitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :new, :create, :update]
  before_action :set_params, only: [:show, :update]

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

  private

  def set_params
    @outfit = Outfit.find(params[:id])
  end

  def outfit_params
    params.require(:outfit).permit(:name, :occasion, :photo)
  end

end
