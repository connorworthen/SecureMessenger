class ForumsController < ApplicationController

  def index
    forums = Forum.all
    render json: forums
  end

  def create
    forum = Forum.new(forum_params)
    if forum.save
      render json: forum
    else
      render json: {errors: game.errors.full_messages}, status: 422
    end
  end

  def show
    forum = Forum.find(params[:id])
    render json: forum, include: [:messages]
  end

  private

  def forum_params
    params.require(:forum).permit(:name)
  end

end
