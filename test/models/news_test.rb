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

require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
