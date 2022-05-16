require "test_helper"

class Profile::DangersControllerTest < ActionDispatch::IntegrationTest

  test "should get index, for a customer" do
    connect_as('customer')
    get profile_danger_url
    assert_response :success
  end

  test "should get index, even for a non-customer : everyone is allowed to quit or disconnect" do
    connect_as('not_a_customer')
    get profile_danger_url
    assert_response :success
  end

end
