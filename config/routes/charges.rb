resources :charges
get  '/pos', to: 'charges#new'
post '/pos', to: 'charges#create'
