class Golfer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google]

 has_many :rounds
 has_many :golf_courses, through: :rounds

   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |golfer|
      golfer.email = auth.info.email
      golfer.password = Devise.friendly_token[0,20]
    end
  end

  def self.lowest_index
    self.index.min
  end

  def self.highest_course_slope
    self.index.max
  end

  def golfer_index
  end

  def course_handicap(golf_course)
    self.index * (golf_course.course_rating / 113)
  end


end
