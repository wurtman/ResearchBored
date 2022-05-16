class Profile::DangersController < ApplicationController
  layout 'profile'
  before_action :authenticate
  
  # Any connected account can quit the app
  skip_verify_authorized

  def show
  end

end
