class WelcomeController < ApplicationController
  #caches_page :index

  def index
    @news = News.all.order("created_at desc").group_by(&:subcate)
  end

  def more_news
    @news = News.all.where(:subcate => params[:subcate]).page(params[:page]).per(30)
  end
end
