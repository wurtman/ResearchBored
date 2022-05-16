require "test_helper"

class Admin::SettingsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @setting = Setting.create!(shareable_draft: false, clock_diff: 0)
  end

  test "should get index, for an admin" do
    connect_as('admin')
    get admin_settings_path
    assert_response :success
  end

  test "should NOT get index, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get admin_settings_path
    end
  end

  test "should update setting, for an admin" do
    connect_as('admin')
    patch admin_setting_path(@setting), params: { setting: { shareable_draft: true, clock_diff: 2 } }
    last_setting = Setting.last
    assert last_setting.id == @setting.id
    assert last_setting.clock_diff == 2
    assert last_setting.shareable_draft == true
    assert_redirected_to admin_settings_path + '?triggered_validation=true'
  end

  test "should update setting, for an admin, but with error" do
    connect_as('admin')
    patch admin_setting_path(@setting), params: { setting: { shareable_draft: true, clock_diff: 1.1 } }
    assert_response 422
  end

  test "should NOT, update setting, for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      patch admin_setting_path(@setting), params: { setting: { shareable_draft: true, clock_diff: 2 } }
    end
  end

end
