class Golfer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google]

   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |golfer|
      golfer.email = auth.info.email
      golfer.password = Devise.friendly_token[0,20]
    end
  end

end
