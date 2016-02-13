class CartsController < ApplicationController
  def show
    @user = current_user
    @cart = Cart.find_by(user_id: @user.id)
    @cart_products = @cart.products
    # CartsProduct.find_by(cart_id: @cart.id, product_id: )
  end

   def edit
    @cart = Cart.find(params[:id])
    @cart_products = @cart.products
    # @quantity = CartsProduct.find_by(cart_id: @cart.id, product_id: prod.id).quantity
  end

  def create
  end

  def update
    CartsProduct.find_by(cart_id: @cart.id, product_id: prod.id).quantity

  end

  private
  def cart_params
    params.require(:cart).permit(:user_id, :total_price, :active?)
  end
end
