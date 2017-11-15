class Tag < ApplicationRecord

  has_many :golf_course_tags
  has_many :tags, through: :golf_course_tags
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
