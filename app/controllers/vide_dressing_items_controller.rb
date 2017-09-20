class VideDressingItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show]
  def new
    @user = User.find(params[:user_id])
    @vide_dressing = VideDressing.find(params[:vide_dressing_id])
    @vide_dressing_item = VideDressingItem.new
  end

  def create
    @vide_dressing_item = VideDressingItem.new(vide_dressing_item_params)
    @user = User.find(params[:user_id])
    @vide_dressing = VideDressing.find(params[:vide_dressing_id])
    @vide_dressing_item.vide_dressing = @vide_dressing
    if @vide_dressing_item.save
      redirect_to user_vide_dressing_path(@user, @vide_dressing)
    else
      render :new
    end
  end

  def show
    @item = VideDressingItem.find(params[:id])
    @vide_dressing = @item.vide_dressing
    @owner = @item.vide_dressing.user
  end

  def add_to_cart
    @item = VideDressingItem.find(params[:id])
    # le current user a-t-il déjà un panier ou faut-il le créer ?
    if current_user.shopping_cart.nil?
      @shopping_cart = ShoppingCart.new
      @shopping_cart.user = current_user
      @shopping_cart.save
    else
      @shopping_cart = current_user.shopping_cart
    end
    @shopping_cart.add(@item, @item.price)
  end

  private

  def vide_dressing_item_params
    params.require(:vide_dressing_item).permit(:name, :category, :price, :gender, photos: [])
  end
end
