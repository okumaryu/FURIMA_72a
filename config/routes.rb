Rails.application.routes.draw do
  root 'products#show'
  resources :products, only: [:new,:create,:show]
  resources :mypage, only: [:index] do
    collection do
      get :logout
      get :credit
    end
  end
  resources :users, only: [:new]
end

