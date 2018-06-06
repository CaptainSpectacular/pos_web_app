resources :inventories, param: :slug

post '/inventories/:slug/import', to: 'import_export#create',
                                  as: :inventory_import

get '/inventories/:slug/export.csv', to: 'import_export#show',
                                 as: :inventory_export
