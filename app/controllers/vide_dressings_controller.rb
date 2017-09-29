require "json"

class VideDressingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def new
    @user = current_user
    @vide_dressing = VideDressing.new
  end

  def create

    if params[:file]
      file = Cloudinary::Uploader.upload(params[:file])
      #créer le JSON de retour
      @json = { file: file }
      return render json: @json
    end

    @vide_dressing = VideDressing.new(vide_dressing_params)
    @user = current_user
    @vide_dressing.user = @user

    # ajouter photo
    url = params["vide_dressing"]["photo"]

    if @vide_dressing.save
      @vide_dressing.photo_url = url # Upload happens here
      redirect_to user_vide_dressing_path(@user, @vide_dressing)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @vide_dressing = VideDressing.find(params[:id])
  end

  def update
  end

  private

  def vide_dressing_params
    params.require(:vide_dressing).permit(:name, :status)
  end
end
