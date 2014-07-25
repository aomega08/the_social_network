Rails.application.routes.draw do
  root to: 'visitors#index'

  post 'login', to: 'sessions#create'
end
