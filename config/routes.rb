Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :preferences
  resources :users
  resources :sessions
  
  root 'welcome#home'
  get '/signup', to: 'users#new'
  get '/search', to: 'preferences#index'
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/underoofadmin', to: 'admin#admins'

  get '/chat', to: 'rooms#index'

  resources :room_messages
  resources :rooms
end
