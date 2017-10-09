class Round < ApplicationRecord

  validates_presence_of :score, :golfer_id, :golf_course_id
end
