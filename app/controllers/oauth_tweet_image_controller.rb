class OauthTweetImageController < ApplicationController

  # get authorization code from MyTweetApp
  def authorize
    redirect_to AuthMyTweetApp.auth_url
  end

  # get callback from MyTweetApp
  def callback
    response = AuthMyTweetApp.get_token(params['code'])
    if response
      # if MyTweetApp reject for authorize to tweet then it will return error
      if response['error_description'].present?
        redirect_to images_path,error: response['error_description']
      # if MyTweetApp reject for authorize to tweet then it will give token
      elsif response['access_token'].present?
        set_auth_token(response['access_token'])
        redirect_images_path
      end
    else
      redirect_images_path
    end
  end

  private
  def redirect_images_path
    redirect_to images_path
  end

end
