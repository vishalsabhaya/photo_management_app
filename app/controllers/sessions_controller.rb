class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  # if user already login then redirect to dashboard directly
  def new
    redirect_to root_path if is_sign_in?
  end

  # authenticate user information & allow to access image screens
  def create
    user_sign_in_params; return if performed?

    user = User.find_by(user_name: params[:session][:user_name])

    if user&.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to root_path
    else
      flash[:error] = t('E0002')
      render :new
    end
  end

  # destroy session
  def destroy
    sign_out if is_sign_in?
    redirect_to sign_in_path
  end

  private

  # validate data & permit strong parameter
  def user_sign_in_params
    @user = FormValidate::SignIn.new(params[:session])
      render :new unless @user.valid?
  end

end
