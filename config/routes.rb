Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :leagues
  resources :users do
    resources :comments, only: :create
  end
  resources :matches
  resources :mainpages

  post 'league/:league_id/user/:user_id/rate/:rate', to: 'ratings#create', as: 'rate_league'

  post 'league/:id/join', to: 'leagues#join', as: 'join_league'
  post 'league/:league_id/userKickOut/:user_id', to: 'leagues#kick', as: 'user_kickout'

  root 'creative#index'
end
