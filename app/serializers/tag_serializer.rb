class TagSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :golf_courses
end
