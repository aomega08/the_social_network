Rails.application.routes.draw do
  root to: 'visitors#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'home', to: 'site#home'
end
