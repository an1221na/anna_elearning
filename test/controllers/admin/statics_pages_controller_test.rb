require 'test_helper'

class Admin::StaticsPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_statics_pages_home_url
    assert_response :success
  end

end
