class ChatsController < ApplicationController
  before_action :authenticate_user!

  # Loads:
  # @chats = all chats
  # @chat = current chat when applicable
  before_action :load_entities

  def index
    @chats = Chat.all
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new permitted_parameters

    if @chat.save
      flash[:success] = "Chat #{@chat.name} was created successfully"
      redirect_to chats_path
    else
      render :new
    end
  end

  def edit
  end
  def show
  end

  def update
    if @chat.update_attributes(permitted_parameters)
      flash[:success] = "Chat #{@chat.name} was updated successfully"
      redirect_to chats_path
    else
      render :new
    end
  end

  protected

  def load_entities
    @chats = Chat.all
    @chat = Chat.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:chat).permit(:name)
  end
end
