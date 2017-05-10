class OutfitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :new, :create]

  def show
  end

  def new
    @outfit = Outfit.new
  end

  def create
  end
end
