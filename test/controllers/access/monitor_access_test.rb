require "test_helper"

class MonitorAccessTest < ActionDispatch::IntegrationTest 


  test "should get sidekiq monitor for an admin" do
    connect_as('admin')
    get sidekiq_path
    assert_response :success
  end

  test "should NOT get sidekiq monitor for a non-admin" do
    connect_as('customer')
    assert_raises SecurityError do
      get sidekiq_path
    end
  end

  test "should get rails_db monitor for an admin" do
    connect_as('admin')
    get rails_db_path
    assert_response :success
  end

  test "should NOT get rails_db monitor for a non-admin" do
    connect_as('customer')
    assert_raises SecurityError do
      get rails_db_path
    end
  end

end
