class MissingItemTargetsController < ApplicationController
  def destroy
    @request = MissingItemTarget.find(params[:id])
    @request.destroy
    redirect_to dashboard_user_path(current_user)
  end
end
