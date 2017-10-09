class GolfCourse < ApplicationRecord

  validates_presence_of :name, :description, :holes, :total_par, :course_slope, :course_rating
  validates_unqiqueness_of :name
  
end
