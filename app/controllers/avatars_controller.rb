class AvatarsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@avatar = current_user.avatars.create(avatar_params)
		if @avatar.valid?
			@avatar.save
			redirect_to user_path(current_user)
		else
			redirect_to user_path(current_user)
			flash[:notice] = "Invalid or missing file. Picture did not save."
		end
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
