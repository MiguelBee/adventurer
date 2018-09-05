class AvatarsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@user.avatars.create(avatar_params)
		redirect_to user_path(@user)
	end

	def destroy
		@avatar = Avatar.includes(:user).find(params[:id]).destroy
		redirect_to user_path(current_user)
	end

private

	def avatar_params
		params.require(:avatar).permit(:picture)
	end
end
