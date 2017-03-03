class PoolsController < ApplicationController

  def show
    @pool = Pool.find(params[:id])

    if @pool.selections.where(winning_selection: true).first
      @winner = @pool.selections.where(winning_selection: true).first.title
    end
    @bet = Bet.new
  end

  def index
    @pools = Pool.all
  end

  def create
    # authorize @pool

    @pool = Pool.new(pool_params)
    @pool.user = current_user

    if @pool.save
      redirect_to pool_path(@pool)
    else
      render :new
    end
  end

  def declare_winner
    @selection = Selection.find(params[:pool][:selection_id])
    @selection.winning_selection = true
    @selection.save
    @pool = Pool.find(params[:id])
    @bets = Bet.where(pool_id: @pool.id)
    @jackpot = (@bets.count * @pool.stake).to_f
    @winners = @bets.where(selection_id: @selection.id)
    @winnings = (@jackpot / @winners.count).to_f
    @user_winners = []
    @winners.each do |bet|
      @user_winners << bet.user
    end
    @user_winners.each do |user|
      user.balance += @winnings
      user.save
    end

    redirect_to :back
  end


  private

  def pool_params
    params.require(:pool).permit(:title, :description, :stake, :end_date,  selections_attributes: [:id, :title, :_destroy], invites_attributes: [:id, :user_id, :_destroy])
  end

end
