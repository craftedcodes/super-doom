Rails.application.routes.draw do
  devise_for :users
  root to: 'superpowers#index'
 # get '/superpowers', to: 'superpowers#index'
 # get '/superpowers/new', to: 'superpowers#new'
 # post '/superpowers', to: 'superpowers#create'
  get '/users/:id', to: 'users#show', as: :user
  get '/dashboard', to: 'pages#dashboard'

  resources :superpowers do
    resources :rents, only: [:create, :show, :index, :destroy]
  end
end
