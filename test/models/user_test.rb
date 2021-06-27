require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Archit Mishra", email: "baba@baba.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "    "
    assert_not @user.valid?         # not used coz we are making sure that blank name is not accepted.
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name shouldnt be longer than 50 chars" do
    @user.name = "a" * 52
    assert_not @user.valid?
  end

  test "email shuldnt be longer than 255 chars" do
    @user.email = "a" * 255 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    # duplicate_user.email.upcase
    @user.save        # coz then we would match dup user against this user in db.(necessary to be in db)
    assert_not duplicate_user.valid?
  end
end
