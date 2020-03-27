require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get shops_dashboard_url
    assert_response :success
  end

end
