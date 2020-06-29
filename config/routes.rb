Rails.application.routes.draw do
  #root 'items#create'
  root 'products#show'
  resources :items, only: [:index, :create, :get] do
  end
end
