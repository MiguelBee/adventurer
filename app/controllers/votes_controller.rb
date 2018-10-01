class VotesController < ApplicationController
	before_action :authenticate_user!

  def create
	  @adventure = Adventure.find(params[:adventure_id])
		if !user_signed_in?
			redirect_to adventure_path(@adventure)
			flash[:notice] = "Must be logged-in to vote"
		elsif
			same_adventure_user?(@adventure)
  		redirect_to adventure_path(@adventure)
  		flash[:alert] = "You cannot vote on your own adventure"
		else
		@adventure.votes.create
  		respond_to do |format|
	  		format.html {redirect_to adventure_path(@adventure), notice: "You voted on this story"}
	  		format.js {}
	  	end
  	end
  end

  def create_vote
  	@post = Post.find(params[:post_id])
  	@adventure = @post.adventure
  	if same_post_user?(@post)
  		redirect_to adventure_path(@adventure)
  		flash[:alert] = "you cannot vote on your own post"
  	else
  	@post.votes.create
  		respond_to do |format|
  			format.html {redirect_to adventure_path(@adventure), notice: 'You voted on post'}
  			format.js {}
  		end
  	end
  end

 private

 	def post_vote
 		params(:post_id).present?
 	end

 	def adventure_vote
 		params(:adventure_id).present?
 	end

 	def same_post_user?(post)
 		post.user == current_user
 	end

 	def same_adventure_user?(adventure)
 		adventure.user == current_user
 	end

end
