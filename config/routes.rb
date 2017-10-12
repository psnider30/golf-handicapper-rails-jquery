Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  devise_for :golfers, :controllers => { omniauth_callbacks: 'omniauth/omniauth_callbacks', registrations: 'registrations' }

  resources :golfers, only: [:index, :show, :destroy] do
    resources :rounds, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :golf_courses do
    resources :rounds, only: [:index]
  end

end
