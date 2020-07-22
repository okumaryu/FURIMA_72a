Rails.application.routes.draw do
  root 'mypage#index' 
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions',
 :passwords     => "users/passwords"
}
 devise_scope :user do
  get 'users/signuplist' => 'users/registrations#signuplist'
  # ↓な気もしますのでrails routesコマンドなどで確認してください
  # get 'signuplist' => 'users/registrations#signuplist'
end
    # resources :users, only: [:new,:edit,:update]

  # root 'mypage#index' 
  resources :items, only: [:new, :create]
end