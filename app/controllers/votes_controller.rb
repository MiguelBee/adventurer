class VotesController < ApplicationController

  def create
  	@adventure = Adventure.find(params[:adventure_id])
  	@adventure.votes.create
  		respond_to do |format|
	  		format.html {redirect_to adventure_path(@adventure), notice: "You voted on this story"}
	  		format.js {}
	  	end
  end

end
