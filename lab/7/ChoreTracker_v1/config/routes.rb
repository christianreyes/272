ChoreTracker::Application.routes.draw do

  # Nifty authentication routes
  match 'user/edit' => 'users#edit', :as => :edit_user
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  resources :sessions
  resources :users
  
  # default page set
  root :to => 'chores#index'
  
  # Generated model routes
  resources :chores
  resources :tasks
  resources :children

end
