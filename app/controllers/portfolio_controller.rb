class PortfolioController < ApplicationController

  before_action :authenticate_user!

  def new

  	if current_user.admin==false
      redirect_to "/"
    end

  	@portfolio = Portfolio.new

  end

  def create

    if current_user.admin==false
      redirect_to "/"
    end

  	portfolio = Portfolio.new
  	portfolio.category = params[:portfolio][:category]
  	portfolio.title = params[:portfolio][:title]
  	portfolio.image = params[:portfolio][:image]
  	portfolio.context = params[:portfolio][:context]
  	portfolio.date = params[:portfolio][:date]
  	portfolio.service = params[:portfolio][:service]
  	portfolio.save

  	redirect_to "/"

  end

  def edit

    if current_user.admin==false
      redirect_to "/"
    end

  	@portfolio = Portfolio.find(params[:id])

  end

  def update

    if current_user.admin==false
      redirect_to "/"
    end

  	portfolio = Portfolio.find(params[:id])
  	portfolio.category = params[:portfolio][:category]
  	portfolio.title = params[:portfolio][:title]
  	portfolio.image = params[:portfolio][:image]
  	portfolio.context = params[:portfolio][:context]
  	portfolio.date = params[:portfolio][:date]
  	portfolio.service = params[:portfolio][:service]
  	portfolio.save

  	redirect_to "/"

  end

  def destroy

    if current_user.admin==false
      redirect_to "/"
    end

  	portfolio = Portfolio.find(params[:id])
  	portfolio.destroy

  	redirect_to "/"

  end


end
