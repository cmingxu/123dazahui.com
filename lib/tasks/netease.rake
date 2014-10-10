require "httparty"
require "rss"

sources = [
  ["新闻", "头条新闻", "http://news.163.com/special/00011K6L/rss_newstop.xml"],
  ["娱乐", "娱乐头条", "http://ent.163.com/special/00031K7Q/rss_toutiao.xml"],
  ["科技", "科技头条", "http://tech.163.com/special/000944OI/headlines.xml"],
  ["汽车", "汽车头条", "http://auto.163.com/special/00081K7D/rsstoutiao.xml"],
  ["手机", "手机头条", "http://mobile.163.com/special/001144R8/mobile163_copy.xml"],
  ["博客", "生活", "http://news.163.com/special/000144P0/style.xml"]
]


def parse_and_save(source, rss)
  feed = RSS::Parser.parse(rss)
  feed.items.each do |item|
    news = News.find_by_md5(Digest::MD5.hexdigest(item.title))
    next if news
    news = News.new do |n|
      n.title = item.title
      n.cate = source[0]
      n.subcate = source[1]
      n.description = item.description
      n.source = source[2]
      n.md5 = Digest::MD5.hexdigest(item.title)
      n.link = item.link
    end

    puts "--- saving " + news.title
    news.save
  end
end


task :netease_news  => :environment do
  sources.each do  |source|
    begin
      parse_and_save(source, HTTParty.get(source[2]).body)
    rescue Exception => e
      puts e
      puts "next..."
    end
  end
end
