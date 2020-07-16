class ProductsController < ApplicationController

  def index
  end

  def show
  end
  
  def new
    @product = Product.new
    @product.productphotos.new
    @product.brands.new
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
   params.require(:product).permit(:name,:description,:price,:category_id,:productcondition_id,:prefecture_id,:postagepayer_id,:shippingdate_id,productphotos_attributes: [:src],brands_attributes: [:name])
  end
end
