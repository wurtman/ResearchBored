class Profile::BillingsController < ApplicationController
  layout 'profile'
  before_action :authenticate
  
  def show
    authorize! :customer    
  end

end
