Rails.application.routes.draw do
  root 'products#index'
  resources :products, only[:index, :show] do
  resources :items, only[:new, :create] 
  end
end
  