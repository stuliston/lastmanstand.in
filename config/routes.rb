LastManStanding::Application.routes.draw do

  root to: 'application#index'

  namespace :api do
    resources :profiles
    resources :leagues, only: [:index]
    resources :games
    resources :game_memberships, only: [ :create ]
  end

end
