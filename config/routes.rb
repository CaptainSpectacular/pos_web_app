Rails.application.routes.draw do
  root 'dashboard#show'
  draw :devise
  draw :users
  draw :charges
  draw :inventories
  draw :cards
  draw :transactions
end
