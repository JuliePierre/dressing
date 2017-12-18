class ProposalsController < ApplicationController

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user
    missing_item = MissingItem.find(params[:missing_item_id])
    @proposal.missing_item = missing_item
    if @proposal.save
      unless params["proposal"]["photos"].nil?
        params["proposal"]["photos"].each do |photo|
          picture = ProposalPicture.new(proposal: @proposal)
          picture.photo = photo
          picture.save
        end
      end
      send_proposal
      redirect_to dashboard_user_path(current_user)
    else
      render :new
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:name, :description, :ref, :photos)
  end

  def send_proposal
    UserMailer.send_proposal(@proposal.user, @proposal.missing_item.user, @proposal).deliver_now
  end

end
