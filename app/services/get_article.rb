class GetArticle

  def call(slug)
    markdown = GetMarkdownInterpreter.new.call
    article = Article.find_by!(slug: slug)
    article_h = article.attributes.deep_symbolize_keys.slice(:title, :kontent, :publication_date)
    article_h[:parsed_content] = markdown.render(article_h[:kontent].gsub("\\k","\n"))
    article_h[:tags] = article.tags.map { |e| e.attributes.deep_symbolize_keys.slice(:display_name, :shortname) }
    if article_h[:publication_date].present?
      article_h[:publication_date] = article_h[:publication_date]
                                        .to_formatted_s(:long_ordinal) # "December 4th, 2007 00:00"
                                        .split(' ').reverse.drop(1).reverse.join(' ') # "December 4th, 2007"
    end
    article_h.except(:kontent)
  end
  
end
