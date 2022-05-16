require "test_helper"

class Admin::AccountsControllerTest < ActionDispatch::IntegrationTest 


  test "should get index for an admin" do
    connect_as('admin')
    get admin_accounts_url
    assert_response :success
  end

  test "should NOT get index for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get admin_accounts_url
    end
  end

  test "should get new for an admin" do
    connect_as('admin')
    get new_admin_account_url
    assert_response :success
  end

  test "should NOT get new for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get new_admin_account_url
    end
  end

  test "should create account for an admin" do
    connect_as('admin')
    assert_difference("Account.count") do
      post admin_accounts_url, params: { account: { name: 'ProfileName', role: 'admin', email: "one@email.com", password: "AnewPwd+1"  } }
    end
    assert_redirected_to admin_account_url(Account.last)
  end

  test "should create account for an admin, but with error" do
    connect_as('admin')
    assert_no_difference("Account.count") do
      post admin_accounts_url, params: { account: { name: 'a', role: 'admin', email: "one@email.com", password: "AnewPwd+1"  } }
    end
    assert_response 422
  end

  test "should NOT create account for a non-admin" do
    connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      post admin_accounts_url, params: { account: { name: 'ProfileName', role: 'admin', email: "one@email.com", password: "AnewPwd+1"  } }
    end
  end

  test "should show account for an admin" do
    @account = connect_as('admin')
    get admin_account_url(@account)
    assert_response :success
  end

  test "should NOT show account for a non-admin" do
    @account = connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get admin_account_url(@account)
    end
  end

  test "should get edit for an admin" do
    @account = connect_as('admin')
    get edit_admin_account_url(@account)
    assert_response :success
  end

  test "should NOT get edit for a non-admin" do
    @account = connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      get edit_admin_account_url(@account)
    end
  end

  test "should update account for an admin" do
    @account = connect_as('admin')
    patch admin_account_url(@account), params: { account: { name: 'AnotherName', role: 'customer', email: "two@email.com"  } }
    assert_redirected_to admin_account_url(@account) + '?triggered_validation=true'
  end

  test "should update account for an admin, but with error" do
    @account = connect_as('admin')
    patch admin_account_url(@account), params: { account: { name: 'a', role: 'customer', email: "two@email.com"  } }
    assert_response 422
  end

  test "should NOT update account for a non-admin" do
    @account = connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      patch admin_account_url(@account), params: { account: { name: 'AnotherName', role: 'customer', email: "two@email.com"  } }
    end
  end

  test "should destroy account for an admin" do
    @account = connect_as('admin')
    assert_difference("Account.count", -1) do
      delete admin_account_url(@account)
    end
    assert_redirected_to admin_accounts_url
  end

  test "should NOT destroy account for a non-admin" do
    @account = connect_as('customer')
    assert_raises ActionPolicy::Unauthorized do
      delete admin_account_url(@account)
    end
  end

end
