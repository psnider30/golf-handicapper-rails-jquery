class GolfCourse < ApplicationRecord

  validates_presence_of :name, :description, :holes, :total_par, :course_slope, :course_rating
  validates_unqiqueness_of :name

  has_many :rounds
  has_many :golfers, through: :rounds

  def self.lowest_course_slope
    self.course_slope.min
  end

  def self.highest_course_slope
    self.course_slope.max
  end

end
