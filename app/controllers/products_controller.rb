class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create,:get_category_children,:get_category_grandchildren]
  before_action :set_card, only: [:buy, :purchase]
  before_action :move_to_index_buy, only: [:buy, :purchase]
  before_action :move_to_index_purchased, only: [:buy, :purchase]

  def index
    @products = Product.all.order('id DESC').limit(4)
  end

  def show
    @product = Product.find(params[:id])
    @product_photos = @product.productphotos
  end
  
  def new
    if user_signed_in?
      @product = Product.new
      @product.productphotos.new
      @product.build_brand
      @category_parent_array = ["---"]
      @category_parent_array = Category.where(ancestry: nil)
    else
      flash.now[:alert] = "ログインしてください。"
      redirect_to root_path
    end
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def buy
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]

    customer = Payjp::Customer.retrieve(@card.customer_id)
    @creditcard_information = customer.cards.retrieve(@card.card_id)
    @card_brand = @creditcard_information.brand 
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

    @user = User.find_by(id: current_user.id)
  end
    
  def purchase
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]

    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
    )

    @product_buyer= Product.find(params[:id])
    @product_buyer.update(buyer_id: current_user.id)
    redirect_to root_path, notice: '購入しました'

  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
    redirect_to root_path
    else
      render :show
    end
  end

  def update_done
    @product_update = Product.order("updated_at DESC").first
  end


  private

  def product_params
   params.require(:product).permit(:name,:description,:price,:category_id,:productcondition_id,:prefecture_id,:postagepayer_id,:shippingdate_id,productphotos_attributes: [:src, :_destroy,:id,:product_id],brand_attributes: [:name,:id,:_destroy]).merge(seller_id: current_user.id)
  end
  
  def set_product
    @product = Product.find(params[:id])
    @product_photos = @product.productphotos
  end

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id) if CreditCard.find_by(user_id: current_user.id).present?
  end

  def move_to_index_buy
    @product = Product.find(params[:id])
    redirect_to root_path if current_user.id == @product.buyer_id
  end

  def move_to_index_purchased
    @product = Product.find(params[:id])
    redirect_to root_path if @product.buyer_id.present? 
  end

end
