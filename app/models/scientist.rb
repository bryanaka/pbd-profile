class Scientist < ActiveRecord::Base
	before_save :create_slug

	has_one		:profile, :dependent => :destroy, :class_name => "ScientistProfile"
	has_many	:websites,:dependent => :destroy, :class_name => "ScientistWebsite"
	has_many	:titles, 	:dependent => :destroy, :class_name => "ScientistTitle"
	belongs_to :user
	accepts_nested_attributes_for :profile, :websites, :titles
  
  validates_presence_of :first_name, :last_name, :picture, :title

	mount_uploader :picture, PictureUploader

	private
		
		def create_slug
			self.slug ||= (self.first_name[0] + self.last_name).downcase!
		end

end
