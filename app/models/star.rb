# == Schema Information
#
# Table name: stars
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  en_name       :string(255)
#  old_name      :string(255)
#  gender        :string(255)
#  country       :string(255)
#  dob           :date
#  constellation :string(255)
#  career        :string(255)
#  height        :string(255)
#  rate          :string(255)
#  blood         :string(255)
#  home_town     :string(255)
#  school        :string(255)
#  company       :string(255)
#  weight        :string(255)
#  religon       :string(255)
#  hobby         :string(255)
#  desc          :text
#  desc_short    :text
#  achievement   :text
#  event         :text
#  source        :string(255)
#  avatar        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Star < ActiveRecord::Base
  PAGE_NO = 898
  BASE_URL = "http://ku.ent.sina.com.cn/star/search&page_no="
  STAR_BASE_URL = "http://ku.ent.sina.com.cn/star/base/"
  STAR_INTRO_URL = "http://ku.ent.sina.com.cn/star/intro/"
  CONSTELLATION = %w(白羊座 金牛座 双子座 巨蟹座 狮子座 处女座 天秤座 天蝎座 射手座 摩羯座 水瓶座 双鱼座)

  COLUMN_HANS_MAP = {
    :name => "中文名",
    :en_name  => "英文名",
    :old_name => "曾用名",
    :gender => "性别",
    :country => "国籍",
    :dob => "出生日期",
    :constellation => "星座",
    :career => "职业",
    :height => "身高",
    :blood => "血型",
    :home_town => "籍贯",
    :school => "毕业院校", 
    :company => "经纪公司",
    :weight => "身高",
    :religon => "宗教信仰",
    :hobby => "兴趣爱好"
  }
end
