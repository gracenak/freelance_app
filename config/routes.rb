Rails.application.routes.draw do
  root 'welcome#home'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :users, only: [:new, :create]
  resources :requests

  resources :gigs, only: [:show] do 
    resources :requests, only: [:show]
  end

  resources :users, only: [:show] do
    resources :gigs, only: [:new, :create, :edit, :update]
  end



  resources :users
  resources :gigs




  
  

  patch 'users/:id' => 'users#update'



  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' =>  'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


