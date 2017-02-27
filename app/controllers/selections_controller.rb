class SelectionsController < ApplicationController

  def create
    @selection = Selection.new(pool_params)
    #@pool.user = current_user

    if @selection.save
      redirect_to selection_path(@selection)
    else
      render :new
    end
  end


end
