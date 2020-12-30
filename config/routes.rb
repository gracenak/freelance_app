Rails.application.routes.draw do
  root 'welcome#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy' 

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/gigs/most_recent', to: 'gigs#most_recent'

  get '/users/contractors', to: 'users#contractors'

  resources :users
  resources :gigs, only: [:index, :show, :create, :update, :destroy]
  
  resources :requests

  resources :users, only: [:show, :index] do
    resources :gigs, only: [:index, :show, :new, :create, :edit, :update]
    
  end 
end