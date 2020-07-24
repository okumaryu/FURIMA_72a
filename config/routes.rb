Rails.application.routes.draw do
  devise_for :users
  root 'products#show'
  resources :products, only: [:new,:create,:show] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'category/get_category_children', to: 'products#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :mypage, only: [:index] do
    collection do
      get :logout
      get :credit
    end
  end
  resources :users, only: [:new]
end

