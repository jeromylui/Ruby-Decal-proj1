Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  get 'new', to: 'pokemons#new', as: 'new'
  post 'new', to: 'pokemons#create', as: 'create'
  patch 'home/:id', to: 'pokemons#capture', as: 'capture'
  patch 'pokemons/', to: 'pokemons#damage', as: 'damage'
end
