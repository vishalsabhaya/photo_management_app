module SessionHelper

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

end
