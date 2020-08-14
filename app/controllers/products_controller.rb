class ProductsController < ApplicationController

  def index
    @products = Product.all.order('id DESC').limit(5)
    # where(category_id:1..1000)
    #.where.not(condition:1).where(condition:0)
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
  private

  def product_params
    params.require(:product).permit(:name,:description,:price,:category_id,:productcondition_id,:prefecture_id,:postagepayer_id,:shippingdate_id,productphotos_attributes: [:src ,:id],brand_attributes: [:name]).merge(seller_id: current_user.id)
  end

  def buy
    
  end


end
