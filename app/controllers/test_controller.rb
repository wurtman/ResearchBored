#
# This controller is meant to be used in test mode only.
#
class TestController < ApplicationController

  skip_verify_authorized

  def get_last_email
    render json: {
      mail: ActionMailer::Base.deliveries.try(:last).try(:body).try(:decoded)
    } 
  end


end
