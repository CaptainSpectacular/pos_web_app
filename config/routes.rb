Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'session' }
  root 'dashboard#show'

  get '/profile', to: 'users#show'
  get '/pos',     to: 'charges#new'
  post '/pos',    to: 'charges#create'

  resources :charges
  resources :cards, param: :slug

  resources :inventories, param: :slug

  post '/inventories/:slug/import', to: 'import_export#create', as: :inventory_import

  get '/inventories/:slug/export.csv', to: 'import_export#show', as: :inventory_export

end
