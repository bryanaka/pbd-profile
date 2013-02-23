class Scientist < ActiveRecord::Base
  # attr_accessible :first_name, :last_name, :picture, :slug, :title
  mount_uploader :picture, PictureUploader
  
end
