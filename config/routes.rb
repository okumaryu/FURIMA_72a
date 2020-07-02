Rails.application.routes.draw do
  #root 'items#create'
  root 'products#show'
  resources :items, only: [:new, :create] do
  end
end
