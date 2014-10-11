require "httparty"
require "nokogiri"


def analysis_index_page(html)
  content = Nokogiri::HTML(html)
  content.css("#dataListInner li a.item-img").each do |star|
    id = star['href'].scan(/\d+/)[0]
    s = Star.new
    icon = star.at_css('img')["src"]
    s.avatar = icon
    analysis_base_page(s, id)
    analysis_intro_page(s, id)
    #star.save
  end
end

def analysis_base_page star, id
  puts id
  content = Nokogiri::HTML(HTTParty.get(Star::STAR_BASE_URL + id))
  #puts content
  basic_infos = content.css(".deatil-content .bor-box .deatils-box .detail-base p")
  puts basic_infos
  basic_infos.each do |info|
    puts info.content
  end
end

def analysis_intro_page star, id
end

desc "grabe stars from sina"
task :stars => :environment do
  for i in 1..Star::PAGE_NO
    html = HTTParty.get(Star::BASE_URL + i.to_s)
    analysis_index_page(html)
  end
end
