Rails.application.routes.draw do
  resources :mypage, only: [:index] do
    collection do
      get :logout
      get :credit
    end
  end

  devise_for :users 

  root 'mypage#index'

  resources :items, only: [:new, :create] do
  end
  resources :users, only: [:new]
end
