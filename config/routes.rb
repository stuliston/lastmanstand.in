LastManStanding::Application.routes.draw do

  root to: 'application#index'

  namespace :api do
    resources :profiles
    resources :leagues
    resources :games
    resources :predictions
    resources :game_memberships, only: [ :create ]
    resources :game_invitations, only: [ :create ]
  end

end
