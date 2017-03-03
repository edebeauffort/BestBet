class ChatsController < ApplicationController
  def create
    @chat = Chat.new(chat_params)
    @chat.save

  end

  private
  def chat_params
    params.require(:chat).permit(:content, :pool_id)
  end

end
