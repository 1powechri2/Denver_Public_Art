Rails.application.routes.draw do
  root 'welcome#index'
  resources :artworks
  resources :users, only: [:new, :create, :show]
end
