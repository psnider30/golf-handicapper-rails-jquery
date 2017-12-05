class GolferSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :rounds
  has_many :golf_course_comments
end
