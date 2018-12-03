class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create_travel_picture create_travel_log create_travel_video destroy]

  def show
    @post = current_adventure.posts.find(params[:id])
  end

  def create_travel_picture
    current_adventure.posts.create(picture_params.merge(user: current_user))
    redirect_to adventure_path(current_adventure)
  end

  def create_travel_log
    @log = current_adventure.posts.create(log_params.merge(user: current_user))
    redirect_to adventure_path(current_adventure) if @log.save
  end

  def edit_log
    @adventure = current_adventure
    @log = current_adventure.posts.find(params[:id])
  end

  def update_log
    @travel_log = current_adventure.posts.find(params[:id])
    @travel_log.update_attributes(log_params)
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
    params.require(:travel_picture).permit(:title, :date, :picture, :caption, :post_type, :tag_list)
  end

  def video_params
    params.require(:travel_video).permit(:title, :date, :video, :post_type, :tag_list)
  end

  def log_params
    params.require(:travel_log).permit(:title, :date, :travel_log, :post_type, :tag_list)
  end
end
