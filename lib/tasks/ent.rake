require "httparty"
require "rss"

task :ent  => :environment do

  def parse_and_save(source, rss)
    feed = RSS::Parser.parse(rss)
    feed.items.each do |item|
      ent = Ent.find_by_md5(Digest::MD5.hexdigest(item.title))
      next if ent
      ent = Ent.new do |n|
        n.title = item.title
        n.desc = item.description
        n.author = item.author
        n.pub = item.pubDate
        n.md5 = Digest::MD5.hexdigest(item.title)
        n.link = item.link
      end

      puts "--- saving " + ent.title
      ent.save
    end
  end
  Ent::SOURCES.each do  |source|
    begin
      parse_and_save(source, HTTParty.get(source).body)
    rescue Exception => e
      puts e
      puts "next..."
    end
  end
end
