Rails.application.routes.draw do
  root 'welcome#home'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :users
  resources :gigs
  resources :requests

  resources :users, only: [:show, :index] do
    resources :gigs, only: [:show, :new, :create, :edit, :update]
  end

  # get '/users/musicians', to: 'users#musicians', as: 'musicians'

  # get '/users/contractors', to: 'users#contractors', as: 'contractors'



  # resources :gigs, only: [:show] do 
  #   resources :requests, only: [:show]
  # end









  
  delete 'gigs/:id' => 'gigs#delete'

  patch 'users/:id' => 'users#update'



  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' =>  'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


