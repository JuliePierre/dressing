class CeremoniesController < ApplicationController
  def create
    @ceremony = current_user.ceremonies.build(ceremony_params)
    if @ceremony.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js  # <-- will render `app/views/ceremonies/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js  # <-- will render `app/views/ceremonies/create.js.erb`
      end
    end
  end

  private

  def ceremony_params
    params.require(:ceremony).permit(:name, :user_id)
  end
end
