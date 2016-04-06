class ScrapsController < ApplicationController

	before_action :authenticate_user!, except:[:show, :list]

	def members
		@user = User.find(params[:id])
		@scrap = @user.scraps.order("created_at DESC")
	end

	def show
  	@scrap = Scrap.find(params[:id])
  end

  def new

  	@scrap = Scrap.new

  end

  def create

  	scrap = Scrap.new
  	scrap.user = current_user
  	scrap.title = params[:scrap][:title]
  	scrap.url = params[:scrap][:url]
  	scrap.context = params[:scrap][:context]
  	scrap.save

  	redirect_to scrap_path(scrap.id)

  end

  def edit

  	@scrap = Scrap.find(params[:id])

  end

  def update

  	scrap = Scrap.find(params[:id])
  	scrap.title = params[:scrap][:title]
  	scrap.url = params[:scrap][:url]
  	scrap.context = params[:scrap][:context]
  	scrap.save

  	redirect_to scrap_path(scrap.id)

  end

  def destroy

  	scrap = Scrap.find(params[:id])
  	scrap.destroy

  	redirect_to members_scraps_path(scrap.user.id)

  end

end
