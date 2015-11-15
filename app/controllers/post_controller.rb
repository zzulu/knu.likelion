class PostController < ApplicationController
  
  before_action :authenticate_user!, except:[:show]

  def show

  	@post = Post.find(params[:id])

  	@reply = Reply.new

  end

  def new
  	@post = Post.new
  end

  def create

  	post = Post.new
  	post.user_id = current_user.id
  	post.title = params[:post][:title]
  	post.sub_title = params[:post][:sub_title]
  	post.context = params[:post][:context]
  	post.save

  	redirect_to "/post/#{post.id}"

  end

  def edit

  	@post = Post.find(params[:id])

  end

  def update

  	post = Post.find(params[:id])
  	post.user_id = current_user.id
  	post.title = params[:post][:title]
  	post.sub_title = params[:post][:sub_title]
  	post.context = params[:post][:context]
  	post.save

  	redirect_to "/post/#{post.id}"

  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy

  	redirect_to "/"

  end

end
