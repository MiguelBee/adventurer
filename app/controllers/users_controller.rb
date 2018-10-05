class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  	@adventures = @user.adventures.order('id DESC')
  	@adventure = Adventure.new
  	@avatar = Avatar.new
  end

private

helper_method :current_avatar

	def current_avatar
		@user.avatars.empty? ? nil : @user.avatars.last.picture
	end

end
