class ApplicationController < ActionController::Base

  # See https://actionpolicy.evilmartians.io/#/authorization_context
  # And https://actionpolicy.evilmartians.io/#/./rails?id=controllers-integration
  authorize :account, through: :current_account

  # See https://actionpolicy.evilmartians.io/#/./rails?id=verify_authorized-hooks
  verify_authorized
  
  private
  
  def authenticate
    rodauth.require_authentication # redirect to login page if not authenticated
  end
  
end
