class Github
  def self.authenticate(code)
    redirect_uri = 'http://localhost:3000/auth'

    posting_url = "https://github.com/login/oauth/access_token"
    posting_params = { client_id: ENV['github_client_id'], client_secret: ENV['github_client_secret'], code: code, redirect_uri: redirect_uri }
    resp = HTTParty.post(posting_url, query: posting_params)
    access_token = Rack::Utils.parse_nested_query(resp.parsed_response)['access_token']
    getting_url = "https://api.github.com/user?access_token=#{access_token}"
    user_attrs = HTTParty.get(getting_url)
    user_attrs
  end
end
