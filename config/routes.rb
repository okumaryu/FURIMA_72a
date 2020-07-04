Rails.application.routes.draw do
  root 'products#show'
  resources :products, only: [:new,:create,:show]
end

