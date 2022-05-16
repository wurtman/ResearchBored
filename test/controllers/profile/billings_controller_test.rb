require "test_helper"

class Profile::BillingsControllerTest < ActionDispatch::IntegrationTest

  test "should get index, for a customer" do
    connect_as('customer')
    get profile_billing_url
    assert_response :success
  end

  test "should NOT get index, for a non-customer" do
    assert_raises ActionPolicy::Unauthorized do
      connect_as('not_a_customer')
      get profile_billing_url
    end
  end

end
