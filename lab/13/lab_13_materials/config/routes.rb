BandBlitz3::Application.routes.draw do

  # Authentication routes
  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  resources :sessions
  resources :users

  # Generated routes
  resources :bands
  resources :genres

  # Default route
  root :to => 'bands#index', :as => :home

end
