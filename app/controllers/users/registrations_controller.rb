# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # GET /resource/sign_up_next
  def signuplist
    @user = User.new
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      super
      users_complete_path and return
    else
      flash.now[:alert] = @user.errors.full_messages
      render :signuplist and return
    end

      # nickname: session[:nickname],
      # email: session[:email],
      # password: session[:password],
      # family_name: session[:family_name],
      # first_name: session[:first_name],
      # family_name_rubi: session[:family_name_rubi],
      # first_name_rubi: session[:first_name_rubi],
      # birth_year: session[:birth_year],
      # birth_month: session[:birth_month],
      # birth_day: session[:birth_day],
      # phone_number: session[:phone_number],
  end

    # private

    # def user_params
    #   params.require(:user).permit(
    #     :nickname,
    #     :email,
    #     :password,
    #     :phone_number,
    #     :family_name,
    #     :first_name,
    #     :family_name_rubi,
    #     :first_name_rubi,
    #     :birth_year,
    #     :birth_month,
    #     :birth_day
    #   )
    # end
end
