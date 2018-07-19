Rails.application.routes.draw do
  root 'welcome#index'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/locations', to: 'locations#index'

  get '/location',  to: 'location#show_art'


  resources :users, only: [:new, :create, :show] do
    get '/locales', to: 'user_locations#index'
    get '/locale', to: 'user_location#show_art'
    resources :artworks, only: [:index, :show] do
      resources :favorites
    end
  end

  namespace :admin do
    resources :categories, only: [:index]
  end
end
