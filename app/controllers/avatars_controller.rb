class AvatarsController < ApplicationController
	#before_action :authenticate_user!

	def create
		@user = User.find(params[:user_id])
		@user.avatars.create(avatar_params)
		redirect_to user_path(@user)
	end

private

	def avatar_params
		params.require(:avatar).permit(:picture)
	end
end
