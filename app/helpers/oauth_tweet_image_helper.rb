module OauthTweetImageHelper

  # store authorize token
  def set_auth_token(token)
    session[:tweet_token] = token
  end

  # token is present then true otherwise false
  def authorized?
    session[:tweet_token].present?
  end

  # return authentication token if authorized
  def get_auth_token
    session[:tweet_token] if authorized?
  end

end