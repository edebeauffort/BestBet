class PoolsController < ApplicationController

  def show


    @user = User.new
    @pool = Pool.find(params[:id])
    @bets = Bet.where(pool_id: @pool.id).count
    @jackpot = (@bets * @pool.stake).to_i

    if @pool.selections.where(winning_selection: true).first
      @winner = @pool.selections.where(winning_selection: true).first
    end

    @bet = Bet.new
    @message = Message.new
    @my_selection = []
    @pool.bets.each do |bet|
      if bet.user == current_user
        @my_selection << bet.selection
      end
    end


    invited_users = []
    @pool.invites. each do |invite|
      invited_users << invite.user
    end
    @invited = invited_users.include? current_user

    betting_users = []
    @pool.bets. each do |bet|
      betting_users << bet.user
    end
    @betted = betting_users.include? current_user

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
      redirect_to root_path
    end
  end

  def declare_winner
    @pool = Pool.find(params[:id])
    @pool.selections.each do |selection|
      selection.winning_selection = false
      selection.save
    end
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

  # def refresh_part
  #   @pool = Pool.all
  #   respond_to do |format|
  #     format.js
  #   end
  # end


  private

  def pool_params
    params.require(:pool).permit(:title, :description, :stake, :end_date,  selections_attributes: [:id, :title, :_destroy], invites_attributes: [:id, :user_id, :_destroy])
  end

end
