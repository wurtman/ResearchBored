class ErrorsController < ApplicationController

  skip_verify_authorized

  def not_found
  end

  def unacceptable
  end

  def internal_server_error
  end
  
end
