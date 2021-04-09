Rails.application.routes.draw do
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
  get 'cities/:state', to: 'application#cities'
  get '/profile', to: 'static_pages#profile'
end
