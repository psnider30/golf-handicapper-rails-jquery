require 'memoist'
class Golfer < ActiveRecord::Base
  extend Memoist
  after_commit :unmemoize_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  validates_presence_of :name

  has_many :rounds
  has_many :golf_courses, through: :rounds
  has_many :golf_course_comments

   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |golfer|
      golfer.email = auth.info.email
      golfer.name = auth.info.name
      golfer.password = Devise.friendly_token[0,20]
    end
  end

  def golfer_round_indexes
    if self.rounds_posted < 20
      # using range [0..-2] excludes only latest round from all calculations
      self.rounds[0..-2].map { |round| round.round_index }
    else
      # using .offset(1) excludes only latest round from all calculations
      recent_twenty = self.rounds.order(created_at: :desc).limit(20).offset(1)
      #sort by the round_index (known as handicap differential and take range of best 10)
      best_ten = recent_twenty.sort_by { |r| r.round_index }[0..9]
      best_ten.map { |round| round.round_index }
    end
  end

  def golfer_index
    # the golfer needs to have at least 2 rounds since the latest round is not used in the calculation for #golfer_round_indexes
    if self.rounds.size > 1
      full_index = (self.golfer_round_indexes.inject { |sum, round_index| sum + round_index }) / self.golfer_round_indexes.count
      index = (full_index * 0.96).round(1)
    end
  end

  def course_handicap(golf_course)
    (self.golfer_index * golf_course.course_slope / 113).round if self.golfer_index
  end

  def rounds_posted
    self.rounds.count
  end

  def course_most_played
    golf_courses_names = self.golf_courses.map { |golf_course| golf_course.name }
    golf_courses_names.max_by { |gc| golf_courses_names.count(gc) }
  end

  memoize :golfer_round_indexes, :golfer_index, :course_handicap, :rounds_posted, :course_most_played

  #class methods
  class << self
    extend Memoist
    
    def all_with_index
      self.all.select { |golfer| golfer.golfer_index }
    end

    def lowest_index
      all_with_index.min_by(&:golfer_index)
    end

    memoize :all_with_index, :lowest_index
  end

end
