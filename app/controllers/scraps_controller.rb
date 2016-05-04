class ScrapsController < ApplicationController

	before_action :authenticate_user!
  before_action :is_member

	def list
		@scrap_all = Scrap.order("created_at DESC")
    @scrap = @scrap_all.limit(10).offset(10*params[:id].to_i)
    @count = @scrap_all.count
	end

	def team

		@team_name = params[:scrap_id].to_s+"조"

		@team_member = User.where(team: params[:scrap_id].to_s)

		@user_id = Array.new
		@team_member.each do |m|
			@user_id << m.id
		end
		@scrap_all = Scrap.where(user_id: @user_id)

		@scrap = @scrap_all.limit(10).offset(10*params[:id].to_i)
		@count = @scrap_all.count if @scrap_all

	end

	def members
		@user = User.find(params[:id])
		@scrap = @user.scraps.order("created_at DESC")
	end

	def show
  	@scrap = Scrap.find(params[:id])
    @scrap.hits+=1
    @scrap.save
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

    private

      def is_member
        redirect_to root_path unless User.find(current_user.id).member
      end

end
