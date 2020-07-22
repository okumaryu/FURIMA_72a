class ProductsController < ApplicationController

  def index
  end

  def show
  end
  def destroy
  @product.destroy
  redirect_to root_path
  end
  
  def new
    @product = Product.new
    @product.productphotos.new
    @product.build_brand
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
   params.require(:product).permit(:name,:description,:price,:category_id,:productcondition_id,:prefecture_id,:postagepayer_id,:shippingdate_id,productphotos_attributes: [:src],brand_attributes: [:name]).merge(seller_id: current_user.id)
  end
end
