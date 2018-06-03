Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'session' }
  root 'dashboard#show'

  get '/profile', to: 'users#show'
  get '/pos',     to: 'charges#new'
  post '/pos',    to: 'charges#create'

  resources :charges
  resources :cards, param: :slug

  resources :inventories

  post '/inventories/:id/import', to: 'import_export#create', as: :inventory_import

  get '/inventories/:id/export.csv', to: 'import_export#show', as: :inventory_export

end
