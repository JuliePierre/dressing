class All::VideDressingsController < ApplicationController
  def index
    @vide_dressings = VideDressing.all
  end
end
