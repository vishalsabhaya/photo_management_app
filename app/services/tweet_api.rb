require 'net/http'

module TweetApi
  # call MyTweetApp post api
  # url, request body and Bearer authentication token for access
  def self.post_api(params)
    uri = URI(params[:url])
    return Net::HTTP.start(uri.host, nil, use_ssl: true) do |http|
      req = Net::HTTP::Post.new(uri)
      req['Content-Type'] = 'application/json'
      req['Authorization'] = "Bearer #{params[:token]}"
      req.body = params[:body].to_json
      http.request(req)
    end
  end
end