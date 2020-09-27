class MessagesController < ApplicationController
  
  def create
    message = Message.new(message_params)
    if message.save
      forum = Forum.find(message.forum_id)
      ForumChannel.broadcast_to(forum, message)
      # render json: message
    else
      render json: {errors: game.errors.full_messages}, status: 422
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :forum_id)
  end

end
