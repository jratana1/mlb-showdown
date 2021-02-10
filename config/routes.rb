Rails.application.routes.draw do
  resources :players
  resources :teams
  resources :users
  root 'users#main'

  get '/showdown', to: 'players#showdown'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
