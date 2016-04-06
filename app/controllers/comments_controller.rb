class CommentsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_comments, only: [:destroy]

	def create

		@comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
  	@comment.save

		redirect_to :back
	end

	def destroy

		@comment.destroy

		redirect_to :back

	end

	private
		def comment_params
		  	params.require(:comment).permit(:context)
		end
		
		def set_comments
			@comment = Comment.find(params[:id])
		end

end
