class Page < ActiveRecord::Base
  validates :title, :desc, :slug, :content, :presence => true
end
