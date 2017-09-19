class All::VideDressingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @vide_dressings = VideDressing.all
  end
end
