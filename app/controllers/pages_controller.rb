class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing, :home ]
  layout "landing", only: [ :landing ]

  def landing
  end

  def home
    @nouveautes = VideDressing.where('status = ?', "Public").order('created_at DESC').first(6)
  end
end
