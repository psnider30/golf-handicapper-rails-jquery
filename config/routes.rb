Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  devise_for :golfers, :controllers => { :omniauth_callbacks => "golfers/omniauth_callbacks" }
  resources :golfers, only: [:index, :show]

  resources :golf_courses

end
