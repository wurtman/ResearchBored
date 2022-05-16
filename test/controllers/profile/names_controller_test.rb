require "test_helper"

class Profile::NamesControllerTest < ActionDispatch::IntegrationTest

  test "should show, for a customer" do
    connect_as('customer')
    get profile_name_url
    assert_response :success
  end

  test "should update name, for a customer" do
    account = connect_as('customer')
    patch profile_name_url, params: { profile: { name: 'MyNewName' } }
    assert_response :found
    assert Account.find(account.id).profile.name == 'MyNewName'
  end

  test "should update name, for a customer, but may fail" do
    account = connect_as('customer')
    patch profile_name_url, params: { profile: { name: 'a' } }
    assert_response 422
  end

end
