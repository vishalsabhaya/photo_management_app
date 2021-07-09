require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(user_name: 'validUserName', password: '1234567890')
  end

  test 'sign_in response is correct' do
    get '/sign_in'
    assert_response :success
  end

  test 'should not sign in with invalid details' do
    get '/sign_in'
    post '/sign_in', params: { session: { user_name: 'invalidUserName', password: '123456789'} }
    assert_equal 200, status
    assert_select 'div', I18n.t('E0002')
    assert_equal '/sign_in', path
  end

  test 'sign in with valid details' do
    get '/sign_in'
    sign_in(@user)
    follow_redirect!
    assert is_sign_in?
    assert_equal 200, status
    assert_equal '/', path
  end

  test 'redirect to sign in page if unauthenticated' do
    get '/'
    follow_redirect!
    assert_equal '/sign_in', path
  end

  test 'session logout if authenticated' do
    # user sign in
    sign_in(@user)
    follow_redirect!
    assert is_sign_in?
    assert_equal '/', path
    # user logout
    delete '/sign_out'
    follow_redirect!
    assert_not is_sign_in?
    assert_equal '/sign_in', path
  end
end
