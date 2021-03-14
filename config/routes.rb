Rails.application.routes.draw do
  # resources :preferences
  # resources :conditions
  resources :users
  resources :sessions
  
  root 'welcome#index'
  get '/signup', to: 'users#new'
 
end
