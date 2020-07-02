Rails.application.routes.draw do
  root 'products#show'
  resources :items, only: [:new, :create] do
  end
end
