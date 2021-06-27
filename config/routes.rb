Rails.application.routes.draw do
  # these static has nothing to do with static keyword
  # # they are just named so by us bcoz' they are static pages.

  # get 'static/home'
  # get 'static/help'
  # get 'static/about'
  #
  # changin the above methods to newer and better ones.

  get '/help', to: 'static#help'
  get '/about', to: 'static#about'
  # get '/home', to: 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  root 'static#home'
end
