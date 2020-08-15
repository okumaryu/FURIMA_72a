Rails.application.routes.draw do
  root 'products#index'
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions',
 :passwords     => "users/passwords"
}
  # resources :users, only: [:index]
 devise_scope :user do
  get 'users/signuplist' => 'users/registrations#signuplist'
  post 'users/signuplist' => 'users/registrations#signuplist'
  post 'users/create' => 'users/registrations#create'
  get 'users/complete' => 'users/registrations#complete'
  # post 'users/complete_submit' => 'users/registrations#complete_submit'
  get 'users/index' => 'users/registrations#index'
  get 'users/:id' => 'users/registrations#show'
  # ↓な気もしますのでrails routesコマンドなどで確認してください
  # get 'signuplist' => 'users/registrations#signuplist'
end

  resources :products, only: [:new,:create,:show,:edit,:update,:destroy] do
  collection do
    get 'category/get_category_children', to: 'products#get_category_children', defaults: { format: 'json' }
    get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', defaults: { format: 'json' }
    get 'update_done'
    get 'buy'
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

