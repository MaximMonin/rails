class ChatMessagesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @chat_message = ChatMessage.create user: current_user,
                                       chat: @chat,
                                       message: params.dig(:chat_message, :message)
    ChatChannel.broadcast_to @chat, @chat_message
  end
end
