# == Schema Information
#
# Table name: news
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  source      :string(255)
#  description :text
#  cate        :string(255)
#  subcate     :string(255)
#  md5         :string(255)
#  link        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class News < ActiveRecord::Base
  after_save :expire_page_cache

  def expire_page_cache
    #FileUtils.rm_rf Rails.root.to_s + "/public/"
  end

  SOURCES = [
    ["娱乐", "娱乐头条", "http://ent.163.com/special/00031K7Q/rss_toutiao.xml"],
    ["新闻", "头条新闻", "http://news.163.com/special/00011K6L/rss_newstop.xml"],
    ["科技", "科技头条", "http://tech.163.com/special/000944OI/headlines.xml"],
    ["汽车", "汽车头条", "http://auto.163.com/special/00081K7D/rsstoutiao.xml"],
    ["手机", "手机头条", "http://mobile.163.com/special/001144R8/mobile163_copy.xml"],
    ["博客", "生活", "http://news.163.com/special/000144P0/style.xml"]
  ]
end
