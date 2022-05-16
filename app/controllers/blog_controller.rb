class BlogController < ApplicationController

  skip_verify_authorized
  
  def index
    @articles = GetArticleList.new.call
  end

  def show
    if Setting.first.shareable_draft == true
      @article = GetArticle.new.call(params[:id])
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
