Rails.application.routes.draw do

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :pokemon
  get '/index', to: 'pokemon#index'
  resources :trainers, only: [:new, :create, :show] 
  resources :belts do
    resources :pokemon, only: [:new, :index]
  end

  root to: 'application#home'

  post '/pokemon/new', to: 'pokemon#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
