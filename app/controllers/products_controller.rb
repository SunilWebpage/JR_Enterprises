class ProductsController < ApplicationController


  def index
    @products = Product.all
    @product = Product.new
  end

def create
  @product = Product.new(product_params)

  if @product.save
    redirect_to items_path(@product.id), notice: "Product created successfully"
  else
    @products = Product.all
    render :index, status: :unprocessable_entity
  end
end

def home
  @products = Product.all
end

 def added_product
@products = Product.all
end

def productview
  @product = Product.find(params[:id])
   if current_user
    @already_in_cart = Cart.exists?(user_id: current_user.id, product_id: @product.id)
  end
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to items_path, notice: "Product deleted successfully"
end



private
def product_params
  params.require(:product).permit(:name, :price, :order_count, :quantity, :image)
end
end
