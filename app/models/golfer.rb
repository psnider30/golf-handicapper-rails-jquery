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
      golfer.password = Devise.friendly_token[0,20]
    end
  end

  def self.lowest_index
    all.golfer_index.min
  end

  def self.highest_course_slope
    all.golfer_index.max
  end

  def golfer_index
  end

  def course_handicap(golf_course)
    self.golfer_index * (golf_course.course_rating / 113)
  end


end
