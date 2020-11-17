Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
 # get '/superpowers', to: 'superpowers#index'
 # get '/superpowers/new', to: 'superpowers#new'
 # post '/superpowers', to: 'superpowers#create'
 # get '/users/:id', to: 'users#show', as: :user

resources :superpowers do
  resources :rents, only: [:create, :show, :index]
end
