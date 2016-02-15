class CartsController < ApplicationController
  def show
    @user = current_user
    @cart = Cart.find_by(user_id: @user.id, active?: true)
    @cart_products = @cart.products
    if request.xhr?
      render layout: false
    end
  end

   def edit
    @cart = Cart.find(params[:id])
    @cart_products = @cart.products
   end

  def create
  end

  def update
  end

  private
  def cart_params
    params.require(:cart).permit(:user_id, :total_price, :active?)
  end
end
