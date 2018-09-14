class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create_travel_picture, :create_travel_log, :create_travel_video]

  def create_travel_picture
    current_adventure.posts.create(picture_params.merge(user: current_user))
    redirect_to adventure_path(current_adventure)
  end

  def create_travel_log
    current_adventure.posts.create(log_params.merge(user: current_user))
    redirect_to adventure_path(current_adventure)
  end

  def create_travel_video
    current_adventure.posts.create(video_params.merge(user: current_user))
    redirect_to adventure_path(current_adventure)
  end

  def destroy
    @post = current_adventure.posts.find(params[:id])
    @post.destroy
    redirect_to adventure_path(current_adventure)
  end

private

  def current_adventure
    Adventure.find(params[:adventure_id])
  end

  def picture_params
    params.require(:post).permit(:title, :picture, :caption, :post_type)
  end

  def video_params
    params.require(:post).permit(:title, :date, :video, :post_type)
  end

  def log_params
    params.require(:post).permit(:title, :date, :travel_log, :post_type)
  end
end
