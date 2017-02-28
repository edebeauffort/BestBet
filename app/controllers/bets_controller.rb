
class BetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :create]
  # def index

  #   @pool = Pool.find(params[:pool_id])
  #   @selection = Selection.find(params[:selection_id])
  #   @user = User.find(params[:user_id])
  # end
  def new
    @pool = Pool.find(params[:pool_id])
    @selection = Selection.find(params[:selection_id])
    @user = User.find(params[:user_id])
    @bet = Bet.new
  end

  def create
    @pool = Pool.find(params[:pool_id])
    @selection = Selection.find(params[:selection_id])
    @user = current_user
    @bet = Bet.new(user_id: @user.id, selection_id: @selection.id, pool_id: @pool.id)
    if @bet.save!
     redirect_to root_path
   else
      redirect_to root_path
    end
  end

  # def show
  #   @bet = Bet.find(params[:id])
  #   @pool = Pool.find(params[:id])
  #   @selection = Selection.find(params[:id])
  #   @user = User.find(params[:id])
  # end
  private

end
