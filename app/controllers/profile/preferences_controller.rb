class Profile::PreferencesController < ApplicationController
  layout 'profile'
  
  before_action :authenticate  
  before_action :set_profile, only: [:show, :update]


  def show
    authorize! :customer    
    if @profile.preferences == {}
      @profile.preferences = {
        marketing_preferences: [],
        report_preference: 'never',
      }
    end
  end

  def update
    authorize! :customer
    @profile.update({preferences: preferences_params})
    redirect_to profile_preference_path(triggered_validation: true), notice: 'Preferences successfully updated.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(current_account.profile.id)
    end

    # Only allow a list of trusted parameters through.
    def preferences_params
      params.require(:choices).permit(:report_preference, marketing_preferences: [])
    end


end
