Rails.application.routes.draw do
  root to: 'visitors#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'home', to: 'site#home'
  get 'search', to: 'site#search'

  get 'profile/:id', to: 'users#show', as: :profile
  get 'profile/:id/about', to: 'users#about', as: :profile_about

  post 'profile/:id/friend', to: 'users#friend', as: :friend_request
  delete 'profile/:id/friend', to: 'users#unfriend'

  resources :posts

  get ':object_id', to: 'site#object'
end
