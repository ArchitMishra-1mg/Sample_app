Rails.application.routes.draw do
  ## I dont think I need this : -           get 'sessions/new'
  ## get 'users/new'
  ## these static has nothing to do with static keyword
  ## they are just named so by us bcoz' they are static pages.

  ## get 'static/home'
  ## get 'static/help'
  ## get 'static/about'
  #
  ## changing the above methods to newer and better ones.

  get '/help', to: 'static#help'
  get '/about', to: 'static#about'
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'       # bro crystal clear smjha ab meko... kaise routing ho rhi hai...
  delete '/logout', to: 'sessions#destroy'

  resources :users                  ## dk how its functioning... ## now I know chicha... it automatically maps
  ## 'user/new' -> users#new & so on... all the rest api requests...

  ## get '/home', to: 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  root 'static#home'
end
