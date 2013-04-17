class News < ActiveRecord::Base
  attr_accessible :title, :body, :date, :url
  validates_uniqueness_of :title, :date, :url
end
