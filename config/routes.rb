Rails.application.routes.draw do

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/index', to: 'pokemon#index'
  resources :pokemons
  resources :belts
  resources :trainers, only: [:new, :create, :show] do 
    resources :belts
  end
  
  

  root to: 'application#home'

  post '/pokemons/new', to: 'pokemons#create'
  delete '/belts/:id', to: 'belts#delete'
  patch '/belts/:id', to: 'belts#update'
  get '/signup', to: 'trainers#new'
  post '/signup', to: 'trainers#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  

end
