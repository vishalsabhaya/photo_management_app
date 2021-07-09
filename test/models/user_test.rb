require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(user_name: "unifa12345", password: "testunifa123")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "user_name must be present" do
    @user.user_name = nil
    assert_not @user.valid?
  end

  test "user_name minimum length must be 10" do
    @user.user_name = "abc"
    assert_not @user.valid?
  end

  test "user_name maximum length must be 30" do
    @user.user_name = "a" * 31
    assert_not @user.valid?
  end

  test "user_name must be alphanumeric" do
    @user.user_name = "vishal_sabhaya"
    assert_not @user.valid?
  end

  test "user_name must be uniq" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

end
