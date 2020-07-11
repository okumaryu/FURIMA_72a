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
    if @product.save!
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def product_params
   params.require(:product).permit(:name,:description)
  end
end
