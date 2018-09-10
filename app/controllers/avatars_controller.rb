class AvatarsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@avatar = current_user.avatars.create(avatar_params)
		redirect_to user_path(current_user)
	end

	def destroy
		@avatar = Avatar.find(params[:id]).destroy
		redirect_to user_path(current_user)
	end

private

	def avatar_params
		params.require(:avatar).permit(:picture)
	end
end
