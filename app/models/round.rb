require 'memoist'
class Round < ApplicationRecord
  extend Memoist
  after_save :unmemoize_all
  validates_presence_of :score, :golfer_id, :golf_course_id

  belongs_to :golfer
  belongs_to :golf_course

  validate do |round|
    if round.golf_course
      round.golf_course.errors.full_messages.each do |msg|
        errors[:base] << "Golf Course Error: #{msg}"
      end
    end
  end

  def golf_course_attributes=(golf_course_attributes)
    # Only checking for name & course_slope since model already validates_presence_of all attributes
    if golf_course_attributes[:name].present? && golf_course_attributes[:course_rating].present?
      golf_course = GolfCourse.find_or_create_by(name: golf_course_attributes[:name],
        description: golf_course_attributes[:description], holes: golf_course_attributes[:holes],
        total_par: golf_course_attributes[:total_par], course_slope: golf_course_attributes[:course_slope],
        course_rating: golf_course_attributes[:course_rating])
      self.golf_course = golf_course

      tag_name = golf_course_attributes[:tags_attributes]['0']['name']
      if tag_name.present?
        tag = Tag.find_or_initialize_by(name: tag_name)
        golf_course.tags << tag
      end
      comment_content = golf_course_attributes[:golf_course_comments_attributes]['0']['content']
      if comment_content.present?
        golfer_id = golf_course_attributes[:golf_course_comments_attributes]['0']['golfer_id']
        comment = GolfCourseComment.new(content: comment_content, golfer_id: golfer_id)
        golf_course.golf_course_comments << comment
      end
    end
  end

  def net_score
    @net_score ||= self.score - self.golfer.course_handicap(self.golf_course) if self.golfer.golfer_index
  end

  def net_from_par
    self.net_score - golf_course.total_par if self.golfer.golfer_index
  end

  def from_par
    self.score - golf_course.total_par
  end

  def display_from_par
    display_from_par_format(from_par)
  end

  def display_net_from_par
    display_from_par_format(net_from_par) if self.golfer.golfer_index
  end

  def display_from_par_format(type)
    over_under = type
    if over_under > 0
      return '+' + over_under.to_s
    elsif over_under < 0
      over_under.to_s
    else
      return 'Even'
    end
  end

  # round_index as handicap differential is just the calculated index for a single round
  def round_index
    @round_index ||= (113 * (self.score - golf_course.course_rating)) / 130
  end

  memoize :net_score, :net_from_par, :from_par, :display_from_par, :display_net_from_par, :round_index

  # class methods

  def self.low_round_score
    @low_round_score ||= self.order(:score).first
  end

  # low gross round
  def self.low_round_from_par
    rounds = self.all.includes(:golf_course, :golfer)
    @low_round_from_par ||= rounds.min_by(&:from_par)
  end

  def self.low_round_net
    @low_round_net ||= self.rounds_with_golfer_index.min_by(&:net_from_par)
  end

  def self.rounds_with_golfer_index
    @@rounds_with_golfer_index ||= self.all.select { |round| round.golfer.golfer_index }
  end

  def self.unmemoize_class_methods_variables
    @low_round_score = nil
    @low_round_from_par = nil
    @low_round_net = nil
    @@rounds_with_golfer_index = nil
  end
end
