class IdeasController < ApplicationController

	before_action :authenticate_user!, except:[:show, :list]

	def list
		@idea_all = Idea.order("created_at DESC")
    @idea = @idea_all.limit(10).offset(10*params[:id].to_i)
    @count = @idea_all.count
	end

	def show
  	@idea = Idea.find(params[:id])
  end

  def new

  	@idea = Idea.new

  end

  def create

  	idea = Idea.new
  	idea.user = current_user
  	idea.title = params[:idea][:title]
  	idea.context = params[:idea][:context]
  	idea.save

  	redirect_to idea_path(idea.id)

  end

  def edit

  	@idea = Idea.find(params[:id])

  end

  def update

  	idea = Idea.find(params[:id])
  	idea.title = params[:idea][:title]
  	idea.context = params[:idea][:context]
  	idea.save

  	redirect_to idea_path(idea.id)

  end

  def destroy

  	idea = Idea.find(params[:id])
  	idea.destroy

  	redirect_to list_ideas_path(0)

  end

end
