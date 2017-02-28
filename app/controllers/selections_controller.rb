class SelectionsController < ApplicationController

  def create
    @selection = Selection.new(selection_params)
    @selection.pool = @pool

    if @selection.save
      redirect_to selection_path(@selection)
    else
      render :new
    end
  end

  def selection_params
    params.require(:selection).permit(:title)
  end
end
