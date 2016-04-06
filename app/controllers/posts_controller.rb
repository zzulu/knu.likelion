class PostsController < ApplicationController

	before_action :authenticate_user!, except:[:show, :list]

  def list
    @post_all = Post.order("created_at DESC")
    @post = @post_all.limit(10).offset(10*params[:id].to_i)
    @count = @post_all.count
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new

    if current_user.admin==false
      redirect_to "/"
    end

  	@post = Post.new

  end

  def create

    if current_user.admin==false
      redirect_to "/"
    end

  	post = Post.new
  	post.user_id = current_user.id
  	post.title = params[:post][:title]
  	post.context = params[:post][:context]
  	post.save

  	redirect_to post_path(post.id)

  end

  def edit

    if current_user.admin==false
      redirect_to "/"
    end

  	@post = Post.find(params[:id])

  end

  def update

    if current_user.admin==false
      redirect_to "/"
    end

  	post = Post.find(params[:id])
  	post.user_id = current_user.id
  	post.title = params[:post][:title]
  	post.context = params[:post][:context]
  	post.save

  	redirect_to post_path(post.id)

  end

  def destroy

    if current_user.admin==false
      redirect_to "/"
    end

  	post = Post.find(params[:id])
  	post.destroy

  	redirect_to "/"

  end

end
