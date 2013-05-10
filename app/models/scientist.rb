class Scientist < ActiveRecord::Base
	before_save :create_slug

	has_one		:profile, :dependent => :destroy, :class_name => "ScientistProfile"
	has_many	:websites,:dependent => :destroy, :class_name => "ScientistWebsite"
	has_many	:titles, 	:dependent => :destroy, :class_name => "ScientistTitle"
	accepts_nested_attributes_for :profile, :websites, :titles
	validates_presence_of :first_name, :last_name, :slug, :picture, :title
  belongs_to :user

	mount_uploader :picture, PictureUploader

	private
		
		def create_slug
			self.slug = (self.first_name[0] + self.last_name).downcase!
		end

end
