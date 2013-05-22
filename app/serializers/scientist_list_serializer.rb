class ScientistListSerializer < ActiveModel::Serializer
	self.root = false
  attributes :id, :first_name, :last_name, :picture, :title, :slug
end
