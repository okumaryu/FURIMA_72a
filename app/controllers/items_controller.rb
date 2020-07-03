class ItemsController < ApplicationController
  def new
    @product = Product.new
    @product.productphotoes.new

  end
  def create
  end
end
