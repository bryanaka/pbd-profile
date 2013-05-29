class ScientistWebsite < ActiveRecord::Base
	belongs_to :scientist
	validates_presence_of :name, :url, :scientist_id
	validates :description, :length => {:maximum => 250}
end