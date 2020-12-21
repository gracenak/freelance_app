Rails.application.routes.draw do
  root 'welcome#home'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/gigs/most_recent', to: 'gigs#most_recent'

  get '/users/contractors', to: 'users#contractors'

  resources :users
  resources :gigs, only: [:index, :show]
  resources :gigs do
    resources :requests
  end

  # scope '/musician' do
  #   resources :requests, only: [:show]
  # end
  resources :requests

  resources :users, only: [:show, :index] do
    resources :gigs, only: [:show, :new, :create, :edit, :update]
  end
 
  delete 'gigs/:id' => 'gigs#delete'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' =>  'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end