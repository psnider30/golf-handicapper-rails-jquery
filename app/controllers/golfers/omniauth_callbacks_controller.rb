class Golfers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @golfer = Golfer.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @golfer  
  end
end
