class ApplicationController < ActionController::Base

  before_action :basic_auth, if: :production?
  # before_action :authenticate_user!    #←これを実行すると、ナゼかログイン画面が最初の画面になってしまう。
  before_action :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :phone_number, :family_name, :first_name, :family_name_rubi, :first_name_rubi, :birthday, :zipcode, :prefecture_code, :city, :house_number, :building_name,])
  end

  private
  
  
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

end
