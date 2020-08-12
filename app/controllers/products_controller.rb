class ProductsController < ApplicationController

  def show_all_instance
    @user = User.find(@product.seller_id)
    @productphotos = Productphoto.where(product_id:params[:id])
    @productphoto_first = Productphoto.where(product_id:params[:id]).first
    @category_id = @product.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  before_action :set_product, except: [:index, :new, :create,:get_category_children,:get_category_grandchildren]
  before_action :show_all_instance, only: [:show, :edit, :destroy]
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

  def edit
    grandchild = @product.category
    child = grandchild.parent
    
     @parent_array = []
     @parent_array << @product.category.parent.parent.name
     @parent_array << @product.category.parent.parent.id

     @category_children_array = Category.where(ancestry: child.ancestry)
     @child_array = []
     @child_array << child.name
     @child_array << child.id

     @category_grandchildren_array = Category.where(ancestry: grandchild.ancestry)
     @grandchild_array = []
     @grandchild_array << grandchild.name
     @grandchild_array << grandchild.id

  end

  def update
    if params[:productphotos_attributes].nil?
      flash.now[:alert] = '更新できませんでした 【画像を１枚以上入れてください】'
      render :edit
    else
      exit_ids = []
      products_params[:prodeuctphotos_attributes].each do |a,b|
        exit_ids << productphotos_params[:productphotos_attributes].dig(:"#{a}",:id).to_i
      end
      ids = Productphoto.where(product_id: params[:id]).map{|productphoto| productphoto.id }
      delete__db = ids - exit_ids
      Productphoto.where(id:delete__db).destroy_all
      @product.touch
      if @product.update(product_params)
        redirect_to  update_done_products_path
      else
        flash.now[:alert] = '更新できませんでした'
        render :edit
    end
  end

  def update_done
    @product_update = Product.order("updated_at DESC").first
  end
end

  private

  def product_params
   params.require(:product).permit(:name,:description,:price,:category_id,:productcondition_id,:prefecture_id,:postagepayer_id,:shippingdate_id,productphotos_attributes: [:src, :_destroy,:id],brand_attributes: [:name]).merge(seller_id: current_user.id)
  end
 
  
end
