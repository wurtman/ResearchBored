class HomeController < ApplicationController

  skip_verify_authorized

  def index
    @quote_of_landing_page = GetEditable.new.call('quote-of-landing-page')
  end

end
