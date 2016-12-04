class MentorsController < ApplicationController
  def new
  end

  def create
    current_user.update_attributes(user_params)
    current_user.mentor!
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :location, :bio)
  end
end
