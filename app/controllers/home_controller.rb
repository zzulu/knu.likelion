class HomeController < ApplicationController
  def index
  
  	@post = Post.limit(5).order("created_at DESC")

  end

  def about
  	
  end


end
