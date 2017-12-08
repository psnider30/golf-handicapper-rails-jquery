class RoundSerializer < ActiveModel::Serializer
  attributes :id, :score, :golfer_id, :golf_course_id, :created_at_simple, :net_score,
    :display_from_par, :display_net_from_par, :golfer_name, :golf_course_name

  belongs_to :golf_course
  belongs_to :golfer
end
