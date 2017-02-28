class BetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  def show
    @bet = Bet.find(params[:id])

    @pool = Pool.find(params[:id])
    @selection = Selection.find(params[:id])
    @user = User.find(params[:id])
  end

end
