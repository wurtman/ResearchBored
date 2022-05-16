class GetArticleList

  def call
    Article.where(is_published: true).order('publication_date DESC').map do |article| 
      res = article.attributes.deep_symbolize_keys.slice(:slug, :publication_date, :title, :description)
      res[:publication_date] = res[:publication_date].strftime("%d %b %Y") # => example : 08 Jan 2022
      res[:tags] = article.tags.map { |tag| tag.display_name }
      res
    end
  end
  
end
