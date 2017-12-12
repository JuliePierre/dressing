class ShoppingCartItemsController < ApplicationController

  def destroy
    @item = ShoppingCartItem.find(params[:id])
    shopping_cart = User.find(@item.owner_id).shopping_cart
    @item.destroy
    respond_to do |format|
      format.html { redirect_to shopping_cart_path(shopping_cart) }
      format.js  # <-- will render `app/views/shopping_cart_items/destroy.js.erb`
    end
  end

end
