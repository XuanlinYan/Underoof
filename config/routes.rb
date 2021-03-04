Rails.application.routes.draw do
  resources :preferences
  resources :conditions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  root 'users#index'
end
