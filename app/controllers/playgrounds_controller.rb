class PlaygroundsController < ApplicationController

	before_action :authenticate_user!
	before_action :is_member

	def friends

    @members = Hash.new
    @counts = Hash.new
    @counts['ideas'], @counts['scraps'] = Array.new, Array.new

    (1..6).each do |x|
      @members[x.to_s] = User.where(team: x.to_s)
      @members[x.to_s].each do |m|
        @counts['ideas'][x], @counts['scraps'][x] = 0, 0
        @counts['ideas'][x] += m.ideas.count
        @counts['scraps'][x] += m.scraps.count
      end
    end

	end

	def list
		@playground_all = Playground.order("created_at DESC")
    @playground = @playground_all.limit(10).offset(10*params[:id].to_i)
    @count = @playground_all.count
	end

	def show
  		@playground = Playground.find(params[:id])
  		@playground.hits+=1
   	@playground.save
  end

  def new

  	@playground = Playground.new

  end

  def create

  	playground = Playground.new
  	playground.user = current_user
  	playground.title = params[:playground][:title]
  	playground.context = params[:playground][:context]
  	playground.save

  	redirect_to playground_path(playground.id)

  end

  def edit

  	@playground = Playground.find(params[:id])

  end

  def update

  	playground = Playground.find(params[:id])
  	playground.title = params[:playground][:title]
  	playground.context = params[:playground][:context]
  	playground.save

  	redirect_to playground_path(playground.id)

  end

  def destroy

  	playground = Playground.find(params[:id])
  	playground.destroy

  	redirect_to list_playgrounds_path(0)

  end

	private
		def is_member
			redirect_to root_path unless User.find(current_user.id).member
		end

end
