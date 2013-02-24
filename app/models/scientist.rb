class Scientist < ActiveRecord::Base
  has_one :scientist_profile
  has_many :scientist_websites
  has_many :scientist_titles

  mount_uploader :picture, PictureUploader
  validates_presence_of :first_name, :last_name, :slug, :picture, :title
end
