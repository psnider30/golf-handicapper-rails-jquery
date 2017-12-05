class GolferSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :golfer_index

  has_many :rounds
  has_many :golf_course_comments
end
