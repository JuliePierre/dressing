class ShoppingCartsController < ApplicationController

  def show
    @cart = ShoppingCart.find(params[:id])
    @pending_loans = current_user.loans.status("Pending")
    @current_loans = current_user.loans.status("Current")
    @past_loans = current_user.loans.status("Past")
  end

end
