class UsersController < ApplicationController
  def auth
    user = Authentication.perform(params[:code])
    if user
      session[:user_id] = user.id
      redirect_to new_mentor_path
    else
      redirect_to home_path
    end
  end

  def home
  end
end
