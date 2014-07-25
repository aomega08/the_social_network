Rails.application.routes.draw do
  root to: 'visitors#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
