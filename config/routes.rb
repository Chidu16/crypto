Rails.application.routes.draw do
  
 
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect("/") , via: [:get, :post]
match 'signout', to: 'sessions#destroy', via: [:get, :post]

  
  root "cryptos#show", id: "bitcoin"
  
  resources :cryptos, only: :show
  
end
