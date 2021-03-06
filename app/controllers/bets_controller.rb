
class BetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :create]
  def index
    @bets = Bet.where(user_id: current_user)

  end

  #   @pool = Pool.find(params[:pool_id])
  #   @selection = Selection.find(params[:selection_id])
  #   @user = User.find(params[:user_id])
  def show
    @bet = Bet.find(params[:id])
    @pool = @bet.selection.pool
    @selection = @bet.selection
  end
  # end

  def create
    @bet = Bet.new(bet_params)
    @bet.user_id = current_user.id
    @user = current_user

    @user.balance_cents -= (@bet.pool.stake * 100).to_i


    if @bet.save!
     @user.save
     redirect_to  pool_path(@bet.selection.pool)
   else
      redirect_to root_path
    end
  end


  private
  def bet_params
     params.require(:bet).permit(:user_id, :selection_id, :pool_id)
  end


end
