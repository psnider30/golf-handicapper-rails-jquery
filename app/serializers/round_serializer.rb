class RoundSerializer < ActiveModel::Serializer
  attributes :id, :score, :golfer_id, :golf_course_id, :created_at, :updated_at

  belongs_to :golf_course
  belongs_to :golfer
end
