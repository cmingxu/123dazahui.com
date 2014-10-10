require "httparty"
require "rss"

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
  News::SOURCES.each do  |source|
    begin
      parse_and_save(source, HTTParty.get(source[2]).body)
    rescue Exception => e
      puts e
      puts "next..."
    end
  end
end
