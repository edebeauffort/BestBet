
class BetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :create]
  # def index

  #   @pool = Pool.find(params[:pool_id])
  #   @selection = Selection.find(params[:selection_id])
  #   @user = User.find(params[:user_id])
   def show
    @bet = Bet.find(params[:id])
    @pool = @bet.pool
    @selection = @bet.selection
  end
  # end

  def create
    @pool = Pool.find(params[:pool_id])
    @selection = Selection.find(params[:selection_id])
    @user = current_user
    @bet = Bet.new(user_id: @user.id, selection_id: @selection.id, pool_id: @pool.id)
    if @bet.save!
     redirect_to  pool_selection_bet_path(@pool, @selection, @bet)
   else
      redirect_to root_path
    end
  end


  private

end
