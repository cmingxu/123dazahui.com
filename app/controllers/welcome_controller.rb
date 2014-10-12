class WelcomeController < ApplicationController
  #caches_page :index

  def index
    @news = News.all.order("created_at desc").group_by(&:subcate)
  end

  def more_news
    @news = News.all.where(:subcate => params[:subcate]).page(params[:page]).per(30)
  end

  ABOUT_PAGES.keys.each do |page|
    define_method page do
      @page = Page.find_by_slug(page)
      render "about", :layout => "about"
    end
  end
end
