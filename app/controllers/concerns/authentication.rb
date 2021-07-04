module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user
  end

  # start session of log in user
  def sign_in(user)
    reset_session
    session[:user_name] = user&.user_name
  end

  #end session of log in user
  def sign_out
    session.delete(:user_name)
    session.delete(:token)
    @current_user = nil
    reset_session
  end

  # if user not authenticated then did not allow access controller method & actions
  def authenticate_user
    unless is_sign_in?
      redirect_to sign_in_path, error: t('E0001')
    end
  end

end