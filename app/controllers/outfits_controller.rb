class OutfitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :new, :create]

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

  private

  def outfit_params
    params.require(:outfit).permit(:name, :photo)
  end

end
