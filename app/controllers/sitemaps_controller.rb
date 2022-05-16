class SitemapsController < ApplicationController

  skip_verify_authorized

  layout :false
  before_action :init_sitemap

  def index
    @blog_articles = Article.where(is_published: true)
  end

  private

  def init_sitemap
    headers['Content-Type'] = 'application/xml'
  end

end
