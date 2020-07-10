Rails.application.routes.draw do
  resources :mypage, only: [:index] do
    get 'logout', to: 'mypage#logout'
  end

  devise_for :users 

  root 'mypage#index'

  resources :items, only: [:new, :create] do
  end
    resources :users, only: [:new]
end
