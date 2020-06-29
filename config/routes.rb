Rails.application.routes.draw do

  root 'products#show'
  resources :item, only: [:index, :create, :get] do
  end
end
