require 'test_helper'

class DeliveryInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get delivery_infos_new_url
    assert_response :success
  end

  test "should get create" do
    get delivery_infos_create_url
    assert_response :success
  end

end
