class Scientist < ActiveRecord::Base
	has_one :scientist_profile, :dependent => :destroy
	has_many :scientist_websites, :dependent => :destroy
	has_many :scientist_titles, :dependent => :destroy
	accepts_nested_attributes_for :scientist_profile
	validates_presence_of :first_name, :last_name, :slug, :picture, :title

	mount_uploader :picture, PictureUploader
end
