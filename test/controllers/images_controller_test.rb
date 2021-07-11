require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(user_name: 'test_user', password: 'test_password', password_confirmation: 'test_password')
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
