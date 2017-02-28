class PoolsController < ApplicationController

  def show
    @pool = Pool.find(params[:id])
  end

  def new
    @pool = Pool.new

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

  def pool_params
    params.require(:pool).permit(:title, :description, :stake, :end_date,  selections_attributes: [:id, :title, :_destroy])
  end

end
