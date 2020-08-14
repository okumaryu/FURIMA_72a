class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create,:get_category_children,:get_category_grandchildren]
  

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

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  

  def update_done
    @product_update = Product.order("updated_at DESC").first
  end

  private

  def product_params
   params.require(:product).permit(:name,:description,:price,:category_id,:productcondition_id,:prefecture_id,:postagepayer_id,:shippingdate_id,productphotos_attributes: [:src, :_destroy,:id],brand_attributes: [:name,:id,:_destroy]).merge(seller_id: current_user.id)
  end

  def buy
  end
  
  def set_product
    @product = Product.find(params[:id])
    @product_photos = @product.productphotos
  end

  
end
