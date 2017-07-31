class UsersController < ApplicationController

  before_action :require_logged_in, only: [:show]

  def new

  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to user_url(user.id)
    else
      redirect_to new_user_url
    end
  end

  def show

  end

  private

  def user_params

    params.require(:user).permit(:username, :password)
  end

end
