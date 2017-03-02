class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit]

  def show
  end
  def edit
  end



  def deposit
    @user = current_user
  end

  def update
    @user = current_user
    @user.balance += (params[:user][:balance]).to_f
    if @user.save
      redirect_to root_path
    else
      render :new
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
      params.require(:user).permit(:email, :password, :balance)
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
