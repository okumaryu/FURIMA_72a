Rails.application.routes.draw do
  resources :items, only: [:new, :create] do
  end
  resources :mypage, only: [:index] do
  end
  get '/logout', to: 'mypage#logout'
end
