Rails.application.routes.draw do
  root 'mypage#index'
  resources :items, only: [:new, :create] do
  end
end
