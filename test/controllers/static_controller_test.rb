require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    get static_home_url
    assert_response :success
    assert_select "title", "Home | RoR Tutorials"
  end

  test "should get help" do
    get static_help_url
    assert_response :success
    assert_select "title", "Help | RoR Tutorials"
  end

  test "should get about" do
    get static_about_url
    assert_response :success
    assert_select "title", "About | RoR Tutorials"
  end
end
