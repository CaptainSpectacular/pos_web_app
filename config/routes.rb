Rails.application.routes.draw do
  devise_for :users
  # Home page
  root 'dashboard#show'

  get '/profile', to: 'users#show'
end
