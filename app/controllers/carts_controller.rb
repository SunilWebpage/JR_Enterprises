class CartsController < ApplicationController
  before_action :require_login

  def index
    @cart_items = Cart.where(user_id: current_user.id).includes(:product)
  end


   def add
    product = Product.find(params[:id])

    @cart_item = Cart.find_by(user_id: current_user.id, product_id: product.id)

    if @cart_item
      @cart_item.quantity += 1
      @cart_item.save
    else
      Cart.create(
        user_id: current_user.id,
        product_id: product.id,
        quantity: 1
      )
    end

    redirect_to productview_path(product), notice: "Product added to cart"
  end

  def destroy
    @cart_item = Cart.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: "Item removed from cart"
  end


  private
  def cart_params
    params.require(:cart).permit(:user_id, :product_id, :quantity)
  end

end
