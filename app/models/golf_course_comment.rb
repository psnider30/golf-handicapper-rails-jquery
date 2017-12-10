require 'memoist'
class GolfCourseComment < ApplicationRecord

  extend Memoist
  after_commit :unmemoize_all

  belongs_to :golfer
  belongs_to :golf_course

  validates_presence_of :content
  validates_uniqueness_of :content, scope: :golf_course_id

  def golfer_name
    self.golfer.name
  end

  def created_at_simple
    self.created_at.strftime('%m/%d/%Y')
  end

  memoize :golfer_name, :created_at_simple
end
