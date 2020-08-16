class ChatMessagesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
  end
end
