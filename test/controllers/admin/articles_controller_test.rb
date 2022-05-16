require "test_helper"

class Admin::ArticlesControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @article = articles(:simple_article)
  end

  test "should get index for an admin" do
    connect_as('admin')
    get admin_articles_url
    assert_response :success
  end

  test "should NOT get index for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get admin_articles_url
    end
  end

  test "should get new article, for an admin" do
    connect_as('admin')
    get new_admin_article_url
    assert_response :success
  end

  test "should NOT get new article, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get new_admin_article_url
    end
  end

  test "should create article for an admin" do
    connect_as('admin')
    assert_difference("Article.count") do
      post admin_articles_url, params: { article:{ title: 'a-new-title', slug: 'a-new-slug' } }
    end
    assert_redirected_to admin_article_url(Article.last)
  end

  test "should create article for an admin, but with error" do
    connect_as('admin')
    assert_no_difference("Article.count") do
      post admin_articles_url, params: { article:{ slug: 'error #', title: 'a-new-title' } }
    end
    assert_response 422
  end

  test "should NOT create article for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      post admin_articles_url, params: { article:{ title: 'a-new-title', slug: 'a-new-slug' } }
    end
  end

  test "should show article for an admin" do
    connect_as('admin')
    get admin_article_url(@article)
    assert_response :success
  end

  test "should NOT show article for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get admin_article_url(@article)
    end
  end

  test "should get edit of article, for an admin" do
    connect_as('admin')
    get edit_admin_article_url(@article)
    assert_response :success
  end

  test "should NOT get edit of article, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get edit_admin_article_url(@article)
    end
  end

  test "should update article for an admin" do
    connect_as('admin')
    patch admin_article_url(@article), params: { article: { slug: 'any-slug' } }
    assert_redirected_to admin_article_url(@article) + '?triggered_validation=true'
  end

  test "should update article for an admin, but with error" do
    connect_as('admin')
    patch admin_article_url(@article), params: { article: { slug: 'error #' } }
    assert_response 422
  end

  test "should NOT update article for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      patch admin_article_url(@article), params: { article: { slug: 'any-slug' } }
    end
  end

  test "should destroy article, for an admin" do
    connect_as('admin')
    assert_difference("Article.count", -1) do
      delete admin_article_url(@article)
    end
    assert_redirected_to admin_articles_url
  end

  test "should NOT destroy article, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      delete admin_article_url(@article)
    end
  end

end
