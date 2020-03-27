require 'test_helper'

class Shop::StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shop_stores_show_url
    assert_response :success
  end

  test "should get edit" do
    get shop_stores_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get shop_stores_destroy_url
    assert_response :success
  end

end
