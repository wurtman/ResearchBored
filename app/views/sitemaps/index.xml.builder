
xml.instruct! :xml, version: '1.0'
xml.tag! 'urlset', 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.tag! 'url' do
    xml.tag! 'loc', root_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', about_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', pricing_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', faq_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', credits_url
  end

  xml.tag! 'url' do
    xml.tag! 'loc', changelog_url
  end

  @blog_articles.each do |blog_article|
    last_date = blog_article.publication_date || blog_article.created_at
    xml.tag! 'url' do
      xml.tag! 'loc', blog_url(blog_article.slug)
      xml.lastmod last_date.strftime("%F")
    end
  end

end
