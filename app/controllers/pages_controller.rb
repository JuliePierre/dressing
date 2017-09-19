class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @nouveautes = VideDressing.where('status = ?', "Public").order('created_at DESC').first(6)
  end
end
