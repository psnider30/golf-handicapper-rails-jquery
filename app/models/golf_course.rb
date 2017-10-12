class GolfCourse < ApplicationRecord

  validates_presence_of :name, :description, :holes, :total_par, :course_slope, :course_rating
  validates_uniqueness_of :name
  validates :holes, inclusion: { in: [9, 18] }

  has_many :rounds
  has_many :golfers, through: :rounds

  def self.lowest_course_slope
      self.order(:course_slope).first
  end

  def self.highest_course_slope
    self.order(:course_slope).last
  end

  def course_lowest_round
    self.rounds.order(:score).first
  end

end
