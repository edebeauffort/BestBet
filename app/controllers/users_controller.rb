class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
      @user.update(user_params)
    if @user.save
      redirect_to root_path
    else
      redirect_to edit_user_registration_path(@user)
    end

  end

  #def update_balance
  #if @user.update(user_params)
   # redirect_to user_path(@user)
  #else
   # render "edit"
  #end
  #end
  #end

  #end

  private
  def user_params
      params.require(:user).permit(:email, :password, :balance, :first_name, :last_name, :username)
  end

  def set_user
    @user = User.find(params[:id])
  end
end






#  def update
#    @booking = Booking.find(params[:id])
#    if params[:commit] == "Accept"
#      @booking.flag = "accepted"
#    else
#      @booking.flag = "declined"
#    end
#    @booking.save
#    redirect_to my_requests_path
#  end
