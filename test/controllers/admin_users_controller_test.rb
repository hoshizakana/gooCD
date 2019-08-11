require 'test_helper'

class AdminUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_users_edit_url
    assert_response :success
  end

end
