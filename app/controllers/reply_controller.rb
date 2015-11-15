class ReplyController < ApplicationController

	before_action :authenticate_user!


	def create

		reply = Reply.new
		reply.user_id = current_user.id
		reply.post_id = params[:post_id]
		reply.context = params[:reply][:context]
		reply.save

		redirect_to :back
	end

	def destroy

		reply = Reply.find(params[:reply_id])
		reply.destroy

		redirect_to :back

	end
end
