class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing, :home ]
  layout "landing", only: [ :landing ]

  def landing
  end

  def home
    @dressing_items = DressingItem.order(:id).first(3)
  end
end
