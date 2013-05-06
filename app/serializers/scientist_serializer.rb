class ScientistSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :picture, :title, :slug
  has_one  :profile, 	:class_name => "ScientistProfile"
  has_many :websites, :class_name => "ScientistWebsite"
  has_many :titles, 	:class_name => "ScientistTitle"
end
