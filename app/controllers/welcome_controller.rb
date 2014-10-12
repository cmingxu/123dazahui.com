class WelcomeController < ApplicationController
  #caches_page :index

  def index
    @news = News.all.group_by(&:subcate)
  end
end
