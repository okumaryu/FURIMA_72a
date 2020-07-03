Rails.application.routes.draw do
  # root 'items#create'
  # root 'products#show'
  root 'mypage#index'
  resources :items, only: [:new, :create] do
  end
end
