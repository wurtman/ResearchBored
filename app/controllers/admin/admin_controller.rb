class Admin::AdminController < ActionController::Base

  # Another layout is used for the admin part
  layout 'admin'

  before_action :authenticate

  # See https://actionpolicy.evilmartians.io/#/authorization_context
  # And https://actionpolicy.evilmartians.io/#/./rails?id=controllers-integration
  authorize :account, through: :current_account

  # See https://actionpolicy.evilmartians.io/#/./rails?id=verify_authorized-hooks
  verify_authorized

  # Home page of the admin part
  def index
    authorize!
  end
  
  private
  
  def authenticate
    rodauth.require_authentication # redirect to login page if not authenticated
  end
  

end
