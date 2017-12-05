class GolfCourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :holes, :total_par, :course_slope, :course_rating

  has_many :rounds
  has_many :tags
  has_many :golf_course_comments
end
