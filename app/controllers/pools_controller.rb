class PoolsController < ApplicationController

  def new
<<<<<<< HEAD
=======
    @pool = Pool.new
>>>>>>> 8961ab6ffd95f893336a5a41680420b7e1462f6b
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
    params.require(:pool).permit(:title, :description, :stake, :closing_date)
  end

end