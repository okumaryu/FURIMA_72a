Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:new,:create,:show]
  resources :mypage, only: [:index] do
    collection do
      get :logout
      get :credit
    end
  end
  resources :users, only: [:new]
end

