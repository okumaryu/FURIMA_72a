class ProductsController < ApplicationController

  def index
  end

  def show
  end
  
  def new
    @product = Product.new
    @product.productphotos.new
  end

  def create
     @product = Product.new(product_params)
     binding.pry
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def product_params
   params.require(:product).permit(:name,:description,:category_id,:productcondition_id,productphotos_attributes: [:src])
  end
end
