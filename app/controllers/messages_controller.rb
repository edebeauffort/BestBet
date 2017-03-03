class MessagesController < ApplicationController

    def create

    @message = Message.new(message_params)
     @message.user_id = current_user.id

    if @message.save
       redirect_to  pool_path(@message.pool)
    else
      raise
    end

  end

  private
  def message_params
    params.require(:message).permit(:message, :pool_id, :user_id)
  end

end
