class ProductsController < ApplicationController

  def index
  end

  def show
  end
  
  def new
    @product = Product.new
    @product.productphotoes.new
  end

  def create
    @product = 
    Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def product_params
    params.require(:product).permit(:name, :price, images_attributes: [:src])
 end
end
