class AdventuresController < ApplicationController
	before_action :authenticate_user!, only: :create

	def show
		@adventure = Adventure.find(params[:id])
	end

	def create
		@user = User.find(params[:user_id])
		@adventure = @user.adventures.create(adventure_params)
		redirect_to user_adventure_path(@user, @adventure)
	end

private

	def adventure_params
		params.require(:adventure).permit(:title, :description, :duration)
	end

end
