class MessagesController < ApplicationController
  def show
    @message = Message.find(params[:id])
  end

    def create
      @message = Message.new(message_params)
      @message.user_id = current_user.id
      @pool = @message.pool
      if @message.save
      respond_to do |format|
        format.html { redirect_to  pool_path(@message.pool) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'pools/show' }
        format.js  # <-- idem
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:message, :pool_id, :user_id)
  end

end
