Rails.application.routes.draw do
  # resources :preferences
  # resources :conditions
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # root 'users#index'
end
