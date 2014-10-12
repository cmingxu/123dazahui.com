class WelcomeController < ApplicationController
  #caches_page :index

  def index
    @news = News.all.order("created_at desc").group_by(&:subcate)
  end
end
