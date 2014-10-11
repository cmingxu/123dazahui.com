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

require 'test_helper'

class StarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
