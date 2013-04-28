LastManStanding::Application.routes.draw do

  root :to => 'application#index'

  resources :profiles
  resources :games

end
