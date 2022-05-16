require "test_helper"

class Admin::EditablesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @editable = Editable.create!(shortname: 'a-shortname', kontent: '# Title', description: 'Words...')
  end

  test "should get index, for an admin" do
    connect_as('admin')
    get admin_editables_url
    assert_response :success
  end

  test "should NOT get index, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get admin_editables_url
    end
  end

  test "should get new, for an admin" do
    connect_as('admin')
    get new_admin_editable_url
    assert_response :success
  end

  test "should NOT get new, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get new_admin_editable_url
    end
  end

  test "should create editable, for an admin" do
    connect_as('admin')
    assert_difference("Editable.count") do
      post admin_editables_url, params: { editable:{ shortname: 'a-new-shortname', kontent: 'Content...', description: 'Description...' } }
    end
    assert_redirected_to admin_editable_url(Editable.last)
  end

  test "should create editable, for an admin, but with errors : nothing is saved" do
    connect_as('admin')
    assert_no_difference("Editable.count") do
      post admin_editables_url, params: { editable:{ shortname: 'error # shortname', kontent: 'Content...', description: 'Description...' } }
    end
    assert_response 422
  end

  test "should NOT create editable, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      post admin_editables_url, params: { editable:{ shortname: 'a-new-shortname', kontent: 'Content...', description: 'Description...' } }
    end
  end

  test "should show editable, for an admin" do
    connect_as('admin')
    get admin_editable_url(@editable)
    assert_response :success
  end

  test "should NOT show editable, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get admin_editable_url(@editable)
    end
  end

  test "should get edit, for an admin" do
    connect_as('admin')
    get edit_admin_editable_url(@editable)
    assert_response :success
  end

  test "should NOT get edit, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get edit_admin_editable_url(@editable)
    end
  end

  test "should update editable, for an admin" do
    connect_as('admin')
    patch admin_editable_url(@editable), params: { editable: { shortname: 'any-short-name' } }
    assert_redirected_to admin_editable_url(@editable) + '?triggered_validation=true'
  end

  test "should update editable, for an admin, but with error" do
    connect_as('admin')
    patch admin_editable_url(@editable), params: { editable: { shortname: 'error #' } }
    assert_response 422
  end

  test "should NOT update editable, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      patch admin_editable_url(@editable), params: { editable: { shortname: 'any-short-name' } }
    end
  end

  test "should destroy editable, for an admin" do
    connect_as('admin')
    assert_difference("Editable.count", -1) do
      delete admin_editable_url(@editable)
    end
    assert_redirected_to admin_editables_url
  end

  test "should NOT destroy editable, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      delete admin_editable_url(@editable)
    end
  end

end
