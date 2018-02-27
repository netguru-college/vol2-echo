Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :leagues
  resources :users
  resources :matches
  resources :mainpages
  
  post 'league/:id/join', to: 'leagues#join', as: 'join_league'
  post 'league/:league_id/userKickOut/:user_id', to: 'leagues#kick', as: 'user_kickout'

  root 'leagues#index'
end
