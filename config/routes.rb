LastManStanding::Application.routes.draw do

  devise_for :users

  get '/welcome', to: 'home#welcome', as: :welcome
  root to: 'home#show'

  namespace :api do
    # resources :profiles
    resources :competitions, only: [ :index ]
    resources :games, only: [ :create, :show ]
    resources :predictions, only: [ :create, :destroy ]
    resources :game_memberships, only: [ :create ]
    resources :game_invitations, only: [ :create, :destroy ]
  end

end
