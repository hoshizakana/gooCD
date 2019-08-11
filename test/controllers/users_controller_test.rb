require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get destroy_confirm" do
    get users_destroy_confirm_url
    assert_response :success
  end

  test "should get orders" do
    get users_orders_url
    assert_response :success
  end

end
