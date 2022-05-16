require 'test_helper'
  
class GetArticleTest < ActiveSupport::TestCase

  test ".call, extract an article" do
    #given
    tag_html = Tag.create(shortname: 'html', display_name: 'HTML', description: 'All about HTML and Markdown')
    tag_js = Tag.create(shortname: 'js', display_name: 'JavaScript', description: 'Everything about JavaScript')
    Article.create(publication_date: "Mon, 31 Jan 2022 15:34:24 +0100".to_date, tags: [tag_html, tag_js], slug: 'markdown-syntax', title: 'Markdown Syntax Guide', is_published: true, description: "An article about Markdown, and a demo of all possible elements", kontent: "Actual content")
    #when
    res = GetArticle.new.call('markdown-syntax')
    #then
    expected = {
      title: "Markdown Syntax Guide", 
      publication_date: "January 31st, 2022", 
      parsed_content: "<p>Actual content</p>\n", 
      tags: [
        {display_name: "HTML", shortname: "html"}, 
        {display_name: "JavaScript", shortname: "js"}
      ]
    }
    assert_equal(expected, res)
  end

end

