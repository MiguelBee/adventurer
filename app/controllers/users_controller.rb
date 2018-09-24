class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  	@adventures = @user.adventures.order('id DESC')
  	@adventure = Adventure.new
  	@avatar = Avatar.new
  end

end
