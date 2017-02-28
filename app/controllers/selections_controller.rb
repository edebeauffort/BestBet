class SelectionsController < ApplicationController

  before_action :set_selection, only: [:new, :create]

  def create
    @selection = Selection.new(selection_params)
    @selection.pool = @pool

    if @selection.save
      redirect_to selection_path(@selection)
    else
      render :new
    end

    authorize @selection
  end

  def selection_params
    params.require(:selection).permit(:title)
  end

  def set_selection
    @selection = Selection.find(params[:title])
  end
end
