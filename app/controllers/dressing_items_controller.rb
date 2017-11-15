require 'JSON'

class DressingItemsController < ApplicationController

  def new
    @dressing_item = DressingItem.new
  end

  def create
    @dressing_item = DressingItem.new(dressing_item_params)
    @dressing_item.save!
    urls = []
    @dressing_item.photos.each do |f|
      urls << f.metadata["url"]
    end
    @dressing_item.pictures_urls = JSON.generate(urls)
    @dressing_item.user = current_user
    if @dressing_item.save
      redirect_to dressing_item_path(@dressing_item)
    else
      render :new
    end
  end

  def index
    @all_items = DressingItem.all
  end

  def show
    @dressing_item = DressingItem.find(params[:id])
    @owner = @dressing_item.user
    @pictures = JSON.parse(@dressing_item.pictures_urls)
    @users_interested = @dressing_item.users_interested
  end

  def edit
    @item = DressingItem.find(params[:id])
    @owner = @item.user
  end

  def update
  end

  def destroy
    @dressing_item = DressingItem.find(params[:id])
    @owner = @dressing_item.user
    @dressing_item.destroy
    redirect_to user_path(@owner)
  end

  def add_to_cart
    @item = DressingItem.find(params[:id])
    # le current user a-t-il déjà un panier ou faut-il le créer ?
    if current_user.shopping_cart.nil?
      @shopping_cart = ShoppingCart.new
      @shopping_cart.user = current_user
      @shopping_cart.save
    else
      @shopping_cart = current_user.shopping_cart
    end
    @shopping_cart.add(@item, @item.price)
    respond_to do |format|
      format.html { redirect_to dressing_item_path(@item) }
      format.js  # <-- will render `app/views/dressing_items/add_to_cart.js.erb`
    end
  end

  private

  def dressing_item_params
    params.require(:dressing_item).permit(:name, :description, :category, :price, :gender, :color, :size, {photos: []}, :photos_cache)
  end


end
