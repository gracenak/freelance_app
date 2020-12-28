Rails.application.routes.draw do
  root 'welcome#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' =>  'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy' 

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/gigs/most_recent', to: 'gigs#most_recent'

  get '/users/contractors', to: 'users#contractors'

  resources :users
  resources :gigs, only: [:index, :show, :create, :update, :destroy]
  
  resources :requests

  resources :users, only: [:show, :index] do
    resources :gigs, only: [:index, :show, :new, :create, :edit, :update]
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end