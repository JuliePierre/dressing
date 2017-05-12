class OutfitsController < ApplicationController
  before_action :set_outfit, only: [:show, :update, :upvote]

  def index
    all_outfits = Outfit.all
    user_friends = User.joins(:friendships).where(friendships: { is_accepted: true, friend_id: current_user.id })
    user_friends_ids = []
    user_friends.each do |friend|
      user_friends_ids << friend.id
    end
    @user_friends_outfits = all_outfits.select do |outfit|
      user_friends_ids.include?(outfit.user_id)
    end
    @outfits = [@user_friends_outfits, current_user.outfits].flatten
  end

  def show
    @missing_items = []
    unless @outfit.missing_item_ids == []
      @outfit.missing_item_ids.each do |id|
        @missing_items << MissingItem.find(id).name
      end
    end
    @missing_items_text = @missing_items.join(' ')
    @proposal = Proposal.new
    @current_proposals = current_user.proposals.where('outfit_id = ?', @outfit.id)
  end

  def new
    @outfit = Outfit.new
    @ceremony = Ceremony.new
    @ceremonies = Ceremony.all
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user

    if @outfit.save
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  def update
    params[:outfit][:missing_item_ids].delete_at(0)
    @outfit.missing_item_ids = params[:outfit][:missing_item_ids]
    if @outfit.update(outfit_params)
      redirect_to outfit_path(@outfit)
    else
      redirect_to root_path
    end

  end

  def upvote
    if current_user.voted_for? @outfit
      @outfit.unliked_by current_user
    else
      @outfit.liked_by current_user
    end

    if @outfit.save
      respond_to do |format|
        format.html { redirect_to outfit_path(@outfit) }
        format.js  # <-- will render `app/views/outfits/upvote.js.erb`
      end
    else
      respond_to do |format|
        format.js  # <-- will render `app/views/outfits/upvote.js.erb`
      end
    end
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:id])
  end

  def outfit_params
    params.require(:outfit).permit(:name, :occasion, :ceremony_id, photos: [])
  end

end
