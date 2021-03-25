Rails.application.routes.draw do
  # resources :preferences
  resources :users
  resources :sessions
  
  root 'welcome#index'
  get '/signup', to: 'users#new'

  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
