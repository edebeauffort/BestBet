class PoolsController < ApplicationController

  def show
    @pool = Pool.find(params[:id])
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
    @pool = Pool.find(params[:id])
    if @selection.save
      raise
      redirect_to pool_path(@pool)

    end

  end


  private

  def pool_params
    params.require(:pool).permit(:title, :description, :stake, :end_date,  selections_attributes: [:id, :title, :_destroy], invites_attributes: [:id, :user_id, :_destroy])
  end

end
