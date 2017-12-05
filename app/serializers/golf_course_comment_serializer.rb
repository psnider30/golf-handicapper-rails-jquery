class GolfCourseCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :golfer_id, :golf_course_id, :created_at

  belongs_to :golf_course
  belongs_to :golfer
end
