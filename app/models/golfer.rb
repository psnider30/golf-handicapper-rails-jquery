class Golfer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google]

validates_presence_of :name

 has_many :rounds
 has_many :golf_courses, through: :rounds

   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |golfer|
      golfer.email = auth.info.email
      golfer.name = auth.info.name
      golfer.password = Devise.friendly_token[0,20]
    end
  end

  def self.lowest_index
    all.golfer_index.min
  end

  def self.highest_course_slope
    all.golfer_index.max
  end

  def golfer_round_indexes
    if self.rounds_posted < 20
      self.rounds.map { |round| round.round_index }
    else
      recent_twenty = self.rounds.order(created_at: :asc).limit(20)
      best_ten = recent_twenty.order(score: :asc).limit(10)
      best_ten.map { |round| round.round_index }
    end
  end

  def golfer_index
    (self.golfer_round_indexes.inject { |sum, round_index| sum + round_index } / self.rounds.count).round(1)
  end

  def course_handicap(golf_course)
    self.golfer_index * (golf_course.course_rating / 113)
  end

  def rounds_posted
    self.rounds.count
  end

  def course_most_played
    golf_courses_names = self.golf_courses.map { |golf_course| golf_course.name }
    golf_courses_names.max_by { |gc| golf_courses_names.count(gc) }
  end


end
