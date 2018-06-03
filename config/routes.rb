Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#show'

  get '/profile', to: 'users#show'
  resources :cards, param: :slug

  resources :inventories

  post '/inventories/:id/import', to: 'import_export#create', as: :inventory_import

  get '/inventories/:id/export.csv', to: 'import_export#show', as: :inventory_export

end
