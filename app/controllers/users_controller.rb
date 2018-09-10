class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  	@adventure = Adventure.new
  	@avatar = Avatar.new
  end

end
