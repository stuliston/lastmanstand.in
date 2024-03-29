LastManStanding::Application.routes.draw do

  devise_for :users

  get '/welcome', to: 'home#welcome', as: :welcome
  get '/games/*anything', to: 'home#show'
  get '/game_invitations', to: 'home#show'
  get '/sign_in', to: 'home#show'
  get '/sign_up', to: 'home#show'
  get '/reset_password', to: 'home#show'
  get '/change_password/*reset_token', to: 'home#show'

  root to: 'home#show'

  namespace :api do
    resources :users do
      resources :game_invitations, only: [ :index ]
    end
    resources :competitions, only: [ :index ]
    resources :games, only: [ :create, :show ]
    resources :rounds, only: [ :index ]
    resources :predictions, only: [ :create, :update, :destroy ]
    resources :game_memberships, only: [ :create ]
    resources :game_invitations, only: [ :create, :destroy ]
  end

end
