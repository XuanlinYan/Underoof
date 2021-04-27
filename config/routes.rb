Rails.application.routes.draw do
  resources :channels do
    resource :channel_user
    resources :messages
  end

  resources :direct_messages
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :preferences, except: :index
  resources :users
  resources :sessions
  
  root 'welcome#home'
  # root 'channels#index'
  get '/signup', to: 'users#new'
  get '/search', to: 'preferences#index'
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/underoofadmin', to: 'admin#admins'
  get 'cities/:state', to: 'application#cities'

end
