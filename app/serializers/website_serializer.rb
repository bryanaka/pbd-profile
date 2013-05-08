class WebsiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url, :updated_at
  self.root = false
end
