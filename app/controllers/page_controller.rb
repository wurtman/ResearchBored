class PageController < ApplicationController

  skip_verify_authorized

  def terms
    @terms_and_conditions = GetEditable.new.call('terms-and-conditions')
  end

end
