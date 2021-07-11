require 'net/http'

module AuthMyTweetApp

  # authorization_url to get authorization code
  def self.auth_url
    "#{Rails.application.secrets.site_path}/oauth/authorize?response_type=code&client_id=#{Rails.application.secrets.client_id}&redirect_uri=#{Rails.application.secrets.redirect_uri}"
  end

  # Get access_token from the MyTweetApp
  def self.get_token(code)
    uri = URI("#{Rails.application.secrets.site_path}/oauth/token")
    res = Net::HTTP.post_form(uri, code: code,
      client_id: Rails.application.secrets.client_id,
      client_secret: Rails.application.secrets.client_secret,
      redirect_uri: Rails.application.secrets.redirect_uri,
      grant_type: 'authorization_code')
    JSON.parse(res.body)
  end
end