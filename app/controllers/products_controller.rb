class ProductsController < ApplicationController

  def index
  end

  def show
    @product = Product.find(params[:id])
    @product_photos = @product.productphotos
  end
  
  def new
    @product = Product.new
    @product.productphotos.new
    @product.build_brand
    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil)
  end
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
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
    @user = current_user
    @creditcard = CreditCard.where(user_id: current_user.id).first
    @address = ShipAddress.where(user_id: current_user.id).first
    @product = Product.find(params[:id])

    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]

    customer = Payjp::Customer.retrieve(@creditcard.customer_id)
    @creditcard_information = customer.cards.retrieve(@creditcard.card_id)
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
  end
    
  def purchase
    @creditcard = CreditCard.where(user_id: current_user.id).first
    @product = Product.find(params[:id])

    Payjp.api_key= Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]

    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: Payjp::Customer.retrieve(@creditcard.customer_id),
      currency: 'jpy'
    )

    @product_buyer= Product.find(params[:id])
    @product_buyer.update( buyer_id: current_user.id)
    redirect_to root_path, notice: '購入しました'
  end


  private

  def product_params
    params.require(:product).permit(:name,:description,:price,:category_id,:productcondition_id,:prefecture_id,:postagepayer_id,:shippingdate_id,productphotos_attributes: [:src ,:id],brand_attributes: [:name]).merge(seller_id: current_user.id)
  end

end
