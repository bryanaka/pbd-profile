class NewsController < ApplicationController

  def index
    @news = News.all
  end

  def edit
    @article = News.find(params[:id])
  end

  def new
    @article = News.new
  end

end
