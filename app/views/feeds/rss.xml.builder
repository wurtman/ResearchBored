xml.instruct! :xml, version: "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "ResearchBored"
    xml.description "A blog for when you're Bored"
    xml.link root_url

    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.description article.description
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link blog_path(article.slug)
        xml.guid blog_path(article.slug)
      end
    end
  end
end
