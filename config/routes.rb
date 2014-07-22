Blog::Application.routes.draw do
 
  resources :users, :blogs
  resources :sessions, :only => [:new, :create, :destroy]
  
  get '/signup', :to => "users#new"
  get '/signin', :to => "sessions#new"
  #match '/signout', :to => "sessions#destroy"
 
  #root 'welcome#index'
end
