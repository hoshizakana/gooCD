require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get process" do
    get orders_process_url
    assert_response :success
  end

  test "should get confirm" do
    get orders_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get orders_complete_url
    assert_response :success
  end

end
