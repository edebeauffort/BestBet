class PoolsController < ApplicationController

  def show
    @pool = Pool.find(params[:id])

    if @pool.selections.where(winning_selection: true).first
      @winner = @pool.selections.where(winning_selection: true).first.title
    end
    @bet = Bet.new
    @my_selection = []
    @pool.bets.each do |bet|
      if bet.user == current_user
        @my_selection << bet.selection
      end
    end


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
    @pool = Pool.find(params[:id])
    @pool.selections.each do |selection|
      selection.winning_selection = false
      selection.save
    end
    @selection = Selection.find(params[:pool][:selection_id])
    @selection.winning_selection = true

    if @selection.save
      redirect_to pool_path(@pool)
    end
  end


  private

  def pool_params
    params.require(:pool).permit(:title, :description, :stake, :end_date,  selections_attributes: [:id, :title, :_destroy], invites_attributes: [:id, :user_id, :_destroy])
  end

end
