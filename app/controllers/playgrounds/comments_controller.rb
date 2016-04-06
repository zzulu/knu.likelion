class Playgrounds::CommentsController < CommentsController
	before_action :set_commentable, only: [:create]
	private
		def set_commentable
			@commentable = Playground.find(params[:playground_id])
		end
end