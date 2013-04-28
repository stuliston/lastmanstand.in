LastManStanding::Application.routes.draw do

  root :to => 'application#index'

  namespace :api do
    resources :profiles
    resources :games
  end

end
