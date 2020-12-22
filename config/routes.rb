Rails.application.routes.draw do

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  get '/index', to: 'pokemon#index'
  resources :pokemons
  resources :belts
  resources :trainers, only: [:new, :create, :show] do 
    resources :belts
  end
  

  root to: 'application#home'

  post '/pokemons/new', to: 'pokemons#create'
  delete '/belts/:id', to: 'belts#delete'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  

end
