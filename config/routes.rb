Rails.application.routes.draw do
  get 'resets/new,'

  get 'resets/create,'

  get 'resets/edit,'

  get 'resets/update,'

  get 'resets/user_params'

  root 'sessions#home' 

  get '/login', to: "sessions#login", as: 'login'
  get '/signup', to: "sessions#signup", as: 'signup'
  post '/login', to: "sessions#attempt_login"
  post '/signup', to: "sessions#create"
  get '/home', to: "sessions#home", as: 'home'
  delete '/logout', to: "sessions#logout", as: "logout"

  resources :schools
  
  resources :users, shallow:true do 
      resources :reviews
  end
end
