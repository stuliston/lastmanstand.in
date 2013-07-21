LastManStanding::Application.routes.draw do

  devise_for :users

  get '/welcome', to: 'home#welcome', as: :welcome
  root to: 'home#show'

  namespace :api do
    resources :profiles
    resources :leagues
    resources :games
    resources :predictions
    resources :game_memberships, only: [ :create ]
    resources :game_invitations, only: [ :create ]
  end

end
