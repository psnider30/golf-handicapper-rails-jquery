class Round < ApplicationRecord

  validates_presence_of :score, :golfer_id, :golf_course_id

  belongs_to :golfer
  belongs_to :golf_course


  def from_par
    over_under = self.score - golf_course.total_par
  end

  def display_from_par
    over_under = from_par
    if over_under > 0
      return '+' + over_under.to_s
    elsif over_under < 0
      over_under.to_s
    else
      return 'Even'
    end
  end

  def round_index
    (113 * (self.score - golf_course.course_rating)) / 130
  end

end
