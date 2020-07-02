Rails.application.routes.draw do
  #root 'items#create'
  root 'products#show'
  resources :items, only: [:show, :create, :get] do
  end
end
