Rails.application.routes.draw do
  resources :mypage, only: [:index] do
  end

  get '/logout', to: 'mypage#logout'

  devise_for :users 

  root 'mypage#index'
  
  resources :items, only: [:new, :create] do
  end
    resources :users, only: [:new]
end
