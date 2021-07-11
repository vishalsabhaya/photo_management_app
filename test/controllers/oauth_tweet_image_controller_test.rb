require 'test_helper'

class OauthControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(user_name: "unifa12345", password: "testunifa123")
  end

  test "get sign in page if user is authenticated" do
    get '/oauth/callback'
    follow_redirect!
    assert_response :success
    assert_equal "/sign_in", path
  end

  test "get callback if user is authenticated" do
    sign_in(@user)
    get '/oauth/callback'
    follow_redirect!
    assert_response :success
    assert_equal "/images", path
  end

end
