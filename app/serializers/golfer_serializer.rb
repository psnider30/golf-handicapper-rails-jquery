class GolferSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :golfer_index, :course_most_played

  has_many :rounds
  has_many :golf_courses, serializer: HomeGolfCourseSerializer
end
