require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(user_name: "unifa12345", password: "testunifa123")
  end

  test 'should not render routes if unauthenticated' do
    get '/images/new'
    follow_redirect!
    assert_equal '/sign_in', path

    get '/images'
    follow_redirect!
    assert_equal '/sign_in', path
  end

  test 'routes must be render if unauthenticated' do
    sign_in(@user)
    get '/images/new'
    assert_equal '/images/new', path
  end
end
