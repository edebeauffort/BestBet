class PoolsController < ApplicationController

  def new
    @pool = Pool.new
  end

  def create

    @pool = Pool.new(pool_params)
    @pool.user = current_user

    if @pool.save!
      redirect_to root_path
    else
      render :new
    end

    authorize @pool
  end

  def pool_params
    params.require(:pool).permit(:title, :description, :stake, :closing_date,  selections_attributes: [:id, :title, :_destroy])
  end

end
