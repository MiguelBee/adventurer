class UsersController < ApplicationController
  def show
  	@current_user = User.find(params[:id])
  	@avatar = Avatar.new
  end

end
