class UsersController < ApplicationController
before_action :set_user, only: [:show]

  def show
  end

  private
  def user_params
      params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
