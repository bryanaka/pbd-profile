class News < ActiveRecord::Base
  attr_accessible :title, :body, :date, :url
end
