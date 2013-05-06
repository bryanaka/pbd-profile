class ScientistListSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :picture, :title, :slug
end
