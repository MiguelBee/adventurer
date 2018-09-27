class AdventuresController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy, :update]

	def show
		@adventure = Adventure.find(params[:id])
		@posts = @adventure.posts.order('id DESC')
		@travel_log = TravelLog.new
    @travel_picture = TravelPicture.new
    @travel_video = TravelVideo.new
    @vote = Vote.new
	end

	def create
		@adventure = current_user.adventures.create(adventure_params)
		redirect_to adventure_path(@adventure)
	end

	def destroy
		@adventure = current_user.adventures.find(params[:id]).destroy
		redirect_to user_path(current_user)
	end

	def update
		@adventure = current_user.adventures.find(params[:id])
		@adventure.update_attributes(adventure_params)
		redirect_to adventure_path(@adventure)
	end

private

	def adventure_params
		params.require(:adventure).permit(:title, :description, :str_date, :end_date, :tag_list)
	end

end
