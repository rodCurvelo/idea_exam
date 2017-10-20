class LikesController < ApplicationController
	def create
  		@like = Like.new(like_params)
  		@like.save
  		redirect_to :back
  	end

  	def like_params
  		params.require(:like).permit(:user_id, :idea_id)
  	end
end
