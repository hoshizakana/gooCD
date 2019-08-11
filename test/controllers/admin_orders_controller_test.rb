require 'test_helper'

class AdminOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_orders_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_orders_edit_url
    assert_response :success
  end

end
