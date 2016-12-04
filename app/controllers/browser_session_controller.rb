class BrowserSessionController < ApplicationController
  def new
    @github_auth_url = Github.authentication_url
  end
end
