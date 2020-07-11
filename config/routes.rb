Rails.application.routes.draw do

  devise_for :users 
  root 'mypage#index'
  resources :items, only: [:new, :create] do
  end
    resources :users, only: [:new,:edit,:update]
end
