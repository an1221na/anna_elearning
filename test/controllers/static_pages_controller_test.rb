require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get dashbord" do
    get static_pages_dashbord_url
    assert_response :success
  end

  test "should get category" do
    get static_pages_category_url
    assert_response :success
  end

  test "should get members" do
    get static_pages_members_url
    assert_response :success
  end

  test "should get profile" do
    get static_pages_profile_url
    assert_response :success
  end

  test "should get setting" do
    get static_pages_setting_url
    assert_response :success
  end

end
