Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/locations', to: 'locations#index'

  get '/location', to: 'location#show_art'
  resources :artworks
  resources :users, only: [:new, :create, :show]
end
