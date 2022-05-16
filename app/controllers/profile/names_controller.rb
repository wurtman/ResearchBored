class Profile::NamesController < ApplicationController
  layout 'profile'
  
  before_action :authenticate  
  before_action :set_profile, only: [:show, :update]

  # Any connected account can change its name
  skip_verify_authorized

  def show
  end

  # PATCH/PUT /profiles/1
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_name_path(triggered_validation: true), notice: 'Name was successfully updated.' }
      else
        flash.now[:alert] = 'Name not updated'
        format.html { render :show, status: :unprocessable_entity, locals: {triggered_validation: true} }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(current_account.profile.id)
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name)
    end

end
