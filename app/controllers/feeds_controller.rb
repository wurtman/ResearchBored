class FeedsController < ApplicationController

  skip_verify_authorized

  layout false

  def rss
    @articles = Article.where(is_published: true).order("created_at DESC")
  end

end
