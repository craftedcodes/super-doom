Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/superpowers', to: 'superpowers#index'
  get '/superpowers/new', to: 'superpowers#new'
  post '/superpowers', to: 'superpowers#create'
end
