ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  #return current signin user object
  def current_user
    if session[:user_name]
      @current_user ||= User.find_by(user_name: session[:user_name])
    end
  end

  #user already sign in then return true otherwise false
  def is_sign_in?
    current_user.present?
  end

  class ActionDispatch::IntegrationTest

    #sign in using user_name & password
    def sign_in(user)
      post '/sign_in', params: { session: { user_name: user.user_name,
                                            password: user.password } }
    end
  end

end
