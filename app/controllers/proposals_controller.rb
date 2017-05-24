class ProposalsController < ApplicationController

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user
    @proposal.outfit = Outfit.find(params[:outfit_id])
    params[:proposal][:missing_item].delete_at(0)
    @proposal.missing_item_id = MissingItem.find_by_name(params[:proposal][:missing_item]).id

    if @proposal.save
      redirect_to outfit_path(@proposal.outfit)
    else
      redirect_to outfit_path(@proposal.outfit)
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:user_id, :missing_item_id, :outfit_id, photos: [])
  end
end
