Rails.application.routes.draw do

  
  get 'belts/index'
  get 'belts/show'
  get 'belts/new'
  get 'belts/create'
  get 'belts/edit'
  get 'belts/update'
  get 'belts/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :pokemon
  get '/index', to: 'pokemon#index'
  resources :trainers, only: [:new, :create, :show] do
    resources :pokemon
  end
  resources :belts

  root to: 'application#home'

  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
