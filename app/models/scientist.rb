class Scientist < ActiveRecord::Base
	before_save :create_slug
	#after_save 	:create_profile

	has_one		:profile, :dependent => :destroy, :class_name => "ScientistProfile"
	has_one 	:user
	has_many	:websites, :dependent => :destroy, :class_name => "ScientistWebsite"
	has_many	:titles, 	:dependent => :destroy, :class_name => "ScientistTitle"
	accepts_nested_attributes_for :profile, :websites, :titles
  
  validates :first_name, :last_name, :title, :presence => true
  validates :slug, :uniqueness => true

	mount_uploader :picture, PictureUploader

	def full_name
		return "#{self.first_name} #{self.last_name}"
	end

	private
		
		def create_slug
			self.slug ||= (self.first_name[0] + self.last_name).downcase!
		end

		#def create_profile
		#	seld.build_profile
		#end

end
