class CreditCardsController < ApplicationController

  require "payjp"
  before_action :move_to_index
  before_action :set_card, only: [:new, :delete, :show]

  def new
    # card = CreditCard.where(user_id: current_user.id).first
    redirect_to action: "show" if @card.present?
  end

  def pay
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )

      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to credit_card_path(@card.id)
      else
        redirect_to action: "show"
      end
    end
  end

  def delete
    if @card.blank?
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to credit_mypage_index_path(@card_id)
  end

  def show
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcb.png"
      when "MasterCard"
        @card_src = "master.png"
      when "American Express"
        @card_src = "americanexpress.png"
      when "Diners Club"
        @card_src = "dinersclub.png"
      when "Discover"
        @card_src = "discover.gif"
      end
    end
  end

  private
  def set_card
    @card = CreditCard.find_by(user_id: current_user.id) if CreditCard.find_by(user_id: current_user.id).present?
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end