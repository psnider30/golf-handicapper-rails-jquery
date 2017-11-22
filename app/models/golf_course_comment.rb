class GolfCourseComment < ApplicationRecord

  belongs_to :golfer
  belongs_to :golf_course

  validates_presence_of :content
  validates_uniqueness_of :content, scope: :golf_course_id
end
