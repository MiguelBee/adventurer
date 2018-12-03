class TagsController < ApplicationController
  def show
    @adventures = Adventure.tagged_with(params[:id])
    @posts = Post.tagged_with(params[:id])
  end
end
