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

  resources :items, only: [:new, :create]
  # resources :mypage do
  #   collection do
  #     get 'mypage/deliver_address' => 'mypage#deliver_address'
  #   end
  # end  
end