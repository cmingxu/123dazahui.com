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
    puts s.name
    s.save
  end
end

def analysis_base_page star, id
  content = Nokogiri::HTML(HTTParty.get(Star::STAR_BASE_URL + id))
  #puts content
  basic_infos = content.css(".deatil-content .bor-box .deatils-box .detail-base p")
  basic_infos.each do |info|
    Star::COLUMN_HANS_MAP.values.each do |key|
      next unless info.content.include?(key.to_s)
      value = info.content.sub(key + "：", "")
      star.send("#{Star::COLUMN_HANS_MAP.invert[key].to_s}=", value.strip)
    end
  end
end

def analysis_intro_page star, id
  content = Nokogiri::HTML(HTTParty.get(Star::STAR_INTRO_URL + id + "?type=intro"))
  desc = content.at_css("body > div.conatiner > div.content.deatil-content > div.bor-box > div > div.box-left.left > div > div.detail-base > p").try(:content)
  content = Nokogiri::HTML(HTTParty.get(Star::STAR_INTRO_URL + id + "?type=achievement"))
  achievement = content.at_css("body > div.conatiner > div.content.deatil-content > div.bor-box > div > div.box-left.left > div > div.detail-base > p").try(:content)
  content = Nokogiri::HTML(HTTParty.get(Star::STAR_INTRO_URL + id + "?type=event"))
  event = content.at_css("body > div.conatiner > div.content.deatil-content > div.bor-box > div > div.box-left.left > div > div.detail-base > p").try(:content)

  star.desc = desc
  star.achievement = achievement
  star.event = event

end

desc "grabe stars from sina"
task :stars => :environment do
  for i in 1..Star::PAGE_NO
    html = HTTParty.get(Star::BASE_URL + i.to_s)
    analysis_index_page(html)
  end
end
