class PoolsController < ApplicationController

  def new
  end

  def create
    @pool = Pool.new(pool_params)
    #@pool.user = current_user

    if @pool.save
      redirect_to pool_path(@pool)
    else
      render :new
    end
  end

end
