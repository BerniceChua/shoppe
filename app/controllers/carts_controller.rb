class CartsController < ApplicationController
  def show
    @user = current_user
    @cart = Cart.find_by(user_id: @user.id)
  end

   def edit
    # @product = Product.find(params[:id])

    # if is_admin?
    #   render_to
    # end
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
