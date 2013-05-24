class NewsController < ApplicationController

  load_and_authorize_resource

  def index
    @news = News.all
  end

  def show
  end

  def update
  end

  def edit
    @article = News.find(params[:id])
  end

  def new
    @article = News.new
  end

  def create
  end

  def destroy
  end

end
