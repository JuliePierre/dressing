class VideDressingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def new
    @user = current_user
    @vide_dressing = VideDressing.new
  end

  def create
    @vide_dressing = VideDressing.new(vide_dressing_params)
    @user = current_user
    @vide_dressing.user = @user
    if @vide_dressing.save
      redirect_to user_vide_dressing_path(@user, @vide_dressing)
    else
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @vide_dressings = @user.vide_dressings
  end

  def show
    @user = User.find(params[:user_id])
    @vide_dressing = VideDressing.find(params[:id])
  end

  def update
  end

  private

  def vide_dressing_params
    params.require(:vide_dressing).permit(:name, :status, :photo)
  end
end
