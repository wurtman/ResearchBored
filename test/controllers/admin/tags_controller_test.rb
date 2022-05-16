require "test_helper"

class Admin::TagsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @tag = tags(:simple_tag)
  end

  test "should get index, for an admin" do
    connect_as('admin')
    get admin_tags_url
    assert_response :success
  end

  test "should NOT get index, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get admin_tags_url
    end
  end

  test "should get new, for an admin" do
    connect_as('admin')
    get new_admin_tag_url
    assert_response :success
  end

  test "should NOT get new, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get new_admin_tag_url
    end
  end

  test "should create tag, for an admin" do
    connect_as('admin')
    assert_difference("Tag.count") do
      post admin_tags_url, params: { tag:{ shortname: 'a-new-shortname', display_name: 'A new name' } }
    end
    assert_redirected_to admin_tag_url(Tag.last)
  end

  test "should create tag, for an admin, but with error" do
    connect_as('admin')
    assert_no_difference("Tag.count") do
      post admin_tags_url, params: { tag:{ shortname: 'error #', display_name: 'A new name' } }
    end
    assert_response 422
  end

  test "should NOT create tag, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      post admin_tags_url, params: { tag:{ shortname: 'a-new-shortname', display_name: 'A new name' } }
    end
  end

  test "should show tag, for an admin" do
    connect_as('admin')
    get admin_tag_url(@tag)
    assert_response :success
  end

  test "should NOT show tag, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get admin_tag_url(@tag)
    end
  end

  test "should get edit, for an admin" do
    connect_as('admin')
    get edit_admin_tag_url(@tag)
    assert_response :success
  end

  test "should NOT get edit, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get edit_admin_tag_url(@tag)
    end
  end

  test "should update tag, for an admin" do
    connect_as('admin')
    patch admin_tag_url(@tag), params: { tag: { shortname: 'any-short-name' } }
    assert_redirected_to admin_tag_url(@tag) + '?triggered_validation=true'
  end

  test "should update tag, for an admin, but with error" do
    connect_as('admin')
    patch admin_tag_url(@tag), params: { tag: { shortname: 'error #' } }
    assert_response 422
  end

  test "should NOT update tag, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      patch admin_tag_url(@tag), params: { tag: { shortname: 'any-short-name' } }
    end
  end

  test "should destroy tag, for an admin" do
    connect_as('admin')
    assert_difference("Tag.count", -1) do
      delete admin_tag_url(@tag)
    end
    assert_redirected_to admin_tags_url
  end

  test "should NOT destroy tag, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      delete admin_tag_url(@tag)
    end
  end

end
