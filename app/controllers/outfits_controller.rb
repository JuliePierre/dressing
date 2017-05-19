class OutfitsController < ApplicationController
  before_action :set_outfit, only: [:show, :update, :upvote]

  def index
    all_outfits = Outfit.all

    user_friends_ids = []

    # My friends (asked for friend and accepted)
    user_friends = current_user.friendships.where("is_accepted = ?", true)
    user_friends.each do |friendship|
      user_friends_ids << friendship.friend_id
    end
    # My inverse friends (they asked my friendship and I accepted)
    user_friends_inverse = current_user.inverse_friendships.where("is_accepted = ?", true)
    user_friends_inverse.each do |friendship|
      user_friends_ids << friendship.user_id
    end
    # all of my friends = user_friends_ids
    # Then, choose these friends'outfits

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
    @user_vote = current_user.voted_as_when_voted_for @outfit
  end

  def new
    @outfit = Outfit.new
    @ceremony = Ceremony.new
    @ceremonies = Ceremony.all
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user
    @outfit.ceremony_id = Ceremony.find_by_name(params[:outfit][:ceremony]).id

    if @outfit.save
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  def update
    unless params[:outfit][:missing_item_ids].nil?
      params[:outfit][:missing_item_ids].delete_at(0)
      @outfit.missing_item_ids = params[:outfit][:missing_item_ids]
    end
    if @outfit.update(outfit_params)
      redirect_to outfit_path(@outfit)
    else
      redirect_to root_path
    end

  end

  def upvote
    @user_vote = current_user.voted_as_when_voted_for @outfit

    if @user_vote
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
    params.require(:outfit).permit(:name, :occasion, :photo, :photo_cache)
  end

end
