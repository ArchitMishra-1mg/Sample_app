Rails.application.routes.draw do
  get 'static/home'
  get 'static/help'
  get 'static/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
