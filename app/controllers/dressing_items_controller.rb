class DressingItemsController < ApplicationController

  def new
    @dressing_item = DressingItem.new
  end

  def create
    @dressing_item = DressingItem.new(dressing_item_params)
    @dressing_item.user = current_user
    if @dressing_item.save
      params["dressing_item"]["photos"].each do |photo|
        picture = DressingItemPicture.new(dressing_item: @dressing_item)
        picture.photo = photo
        picture.save
      end
      redirect_to dressing_item_path(@dressing_item)
    else
      render :new
    end
  end

  def index
    @dressing_items = DressingItem.where(nil)
    filtering_params(params).each do |key, value|
      if value.present?
        @dressing_items = @dressing_items.public_send(key, value)
      end
    end
    @nb_criteres_filtre = 0
    unless params["gender"].nil?
      @nb_criteres_filtre += params["gender"].size
    end
    unless params["category"].nil?
      @nb_criteres_filtre += params["category"].size
    end
    @dressing_items = @dressing_items.select { |item| item.is_available_for(current_user) }
  end

  def show
    @dressing_item = DressingItem.find(params[:id])
    @owner = @dressing_item.user
    @pictures = @dressing_item.dressing_item_pictures
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

  def add_to_loans
    @item = DressingItem.find(params[:id])
  end

  def add_to_favorite
    @item = DressingItem.find(params[:id])
    @item.liked_by current_user
    redirect_to dressing_item_path(@item)
  end

  def remove_from_favorite
    @item = DressingItem.find(params[:id])
    @item.unliked_by current_user
    redirect_to dressing_item_path(@item)
  end

  private

  def dressing_item_params
    params.require(:dressing_item).permit(:name, :description, :category, :price, :gender, :color, :size, :brand, :ref, :photos, :to_sell, :to_rent, :to_lend)
  end

  def filtering_params(params)
    params.slice(:gender, :category)
  end

end
