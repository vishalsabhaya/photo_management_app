class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Authentication
  include SessionHelper
  include OauthTweetImageHelper

end
