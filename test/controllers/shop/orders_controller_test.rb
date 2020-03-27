require 'test_helper'

class Shop::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get shop_orders_show_url
    assert_response :success
  end

  test "should get edit" do
    get shop_orders_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get shop_orders_destroy_url
    assert_response :success
  end

end
