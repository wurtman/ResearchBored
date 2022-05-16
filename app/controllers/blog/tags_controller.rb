class Blog::TagsController < ApplicationController

  skip_verify_authorized
  
  def index
    @tags = Tag.all.map do |tag| 
      tag.attributes.deep_symbolize_keys.merge({number_of_articles: tag.articles.size})
    end
  end

  def show
    found_tag = Tag.find_by(shortname: params[:id])
    # found_articles = Article.joins(:tags).where(:tags => { :id => found_tag.id } )

    @tag = found_tag.attributes.deep_symbolize_keys
    @articles = found_tag.articles.map { |e| e.attributes.deep_symbolize_keys }
  end

end
