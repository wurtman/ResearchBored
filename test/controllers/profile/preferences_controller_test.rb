require "test_helper"

class Profile::PreferencesControllerTest < ActionDispatch::IntegrationTest

  test "should show, for a customer" do
    connect_as('customer')
    get profile_preference_url
    assert_response :success
  end


  test "should NOT show, for a non-customer" do
    connect_as('not_a_customer')
    assert_raises ActionPolicy::Unauthorized do
      get profile_preference_url
    end
  end

  test "should update preference, for a customer" do
    # Given
    new_preference = 'always'
    account = connect_as('customer')
    assert Account.find(account.id).profile.preferences['report_preference'] != new_preference
    # When
    patch profile_preference_url, params: { choices: {report_preference: new_preference} }
    # Then
    assert_response :found
    assert Account.find(account.id).profile.preferences['report_preference'] == new_preference
  end

  test "should NOT update preference, for a non-customer" do
    account = connect_as('not_a_customer')
    assert_raises ActionPolicy::Unauthorized do
      patch profile_preference_url, params: { choices: {report_preference: 'any'} }
    end
  end

end
