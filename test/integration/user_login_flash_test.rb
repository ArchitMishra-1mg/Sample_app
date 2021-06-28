require "test_helper"

class UserLoginFlashTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'login with inv info' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: {email: "Arc@it.com", password: "rails123"}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
