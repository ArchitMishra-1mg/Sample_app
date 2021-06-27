require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_path
    assert_response :success
  end

  # test "should get home" do
  #   get home_path
  #   assert_response :success
  #   assert_select "title", "Home | RoR Tutorials"
  # end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | RoR Tutorials"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | RoR Tutorials"
  end
end
