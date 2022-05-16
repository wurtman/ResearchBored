class RodauthController < ApplicationController
  layout 'authentication'
  # used by Rodauth for rendering views, CSRF protection, and running any
  # registered action callbacks and rescue_from handlers

  # No authorization are required to create or close accounts.
  skip_verify_authorized

end
