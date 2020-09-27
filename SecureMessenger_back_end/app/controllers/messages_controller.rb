class MessagesController < ApplicationController
  
  def index
    messages = Message.all
    render json: messages
  end
  
  def create
    message = Message.new(message_params)
    if message.save
      render json: message
    else
      render json: {errors: game.errors.full_messages}, status: 422
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :forum_id)
  end

end
