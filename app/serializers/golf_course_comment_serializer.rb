class GolfCourseCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :golfer_name, :created_at_simple, :golf_course_id

  # belongs_to :golf_course
  # belongs_to :golfer
end
