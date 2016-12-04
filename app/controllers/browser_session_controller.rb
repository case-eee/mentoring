class BrowserSessionController < ApplicationController
  def new
    redirect_uri = "http://localhost:3000/auth"
    @github_auth = "https://github.com/login/oauth/authorize?client_id=#{ENV['github_client_id']}&redirect_uri=#{redirect_uri}"
  end
end
