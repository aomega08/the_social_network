Rails.application.routes.draw do
  root to: 'visitors#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'home', to: 'site#home'
  get 'search', to: 'site#search'

  get 'profile(/:id)', to: 'users#show', as: :profile

  get ':object_id', to: 'site#object'
end
