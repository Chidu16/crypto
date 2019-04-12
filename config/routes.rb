Rails.application.routes.draw do
  
  root "cryptos#show", id: "bitcoin"
  
  resources :cryptos, only: :show
  
end
