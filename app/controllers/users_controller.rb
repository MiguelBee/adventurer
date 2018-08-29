class UsersController < ApplicationController
	before_action :authenticate_user!
  def show
  	@current_user = User.find(params[:id])
  end
end
