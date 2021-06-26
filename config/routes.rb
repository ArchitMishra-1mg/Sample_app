Rails.application.routes.draw do
  get 'static/home'       # these static has nothing to do with static keyword
  get 'static/help'       # they are just named so by us bcoz' they are static pages.
  get 'static/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  root 'static#home'
end
