class Scraps::CommentsController < CommentsController
	before_action :set_commentable, only: [:create]
	private
		def set_commentable
			@commentable = Scrap.find(params[:scrap_id])
		end
end