class GolfCourse < ApplicationRecord

  validates_presence_of :name, :description, :holes, :total_par, :course_slope, :course_rating
  validates_uniqueness_of :name
  validates :holes, numericality: { equal_to: 18 }
  validates :total_par, numericality: { greater_than: 62 }
  validates :course_rating, numericality: { greater_than: 60 }
  validates :course_slope, numericality: { greater_than: 99 }

  has_many :rounds
  has_many :golfers, through: :rounds
  has_many :golf_course_tags
  has_many :tags, through: :golf_course_tags

  def tags_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      if tag_attribute[:name].present?
        tag = Tag.find_or_create_by(name: tag_attribute[:name])
        if !self.tags.include?(tag)
          self.golf_course_tags.build(tag: tag)
        end
      end
    end
  end

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
