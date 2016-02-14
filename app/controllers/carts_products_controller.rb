class CartsProductsController < ApplicationController
	def new
	end

	def update
		params.require(:carts_product).permit(:quantity, :id, :cart_id, :product_id)
		@cart_product = CartsProduct.find(params[:id])

		if @cart_product.update_attributes(quantity: params[:carts_product][:quantity].to_i)
			redirect_to Cart.find(@cart_product.cart_id)
		#else
			#
		end
	end

	def create
		@cart = Cart.find_by({user_id: params[:user_id], active?: true})
		cart_product = CartsProduct.create({product_id: params[:product_id], cart_id: @cart.id})
		redirect_to @cart
	end

	def checkout
		@cart = Cart.find(params[:id])
		# params.require(:carts_product).permit(:quantity, :id, :cart_id, :product_id)
		# @cart_product = CartsProduct.find()

		@cart.products.each do |product|
			quantity_purachased = CartsProduct.find_by({product_id: product.id, cart_id: @cart.id}).quantity
			product.reduce_inventory_after_checkout(quantity_purachased)
		end
		@cart.update_attributes(active?: false, total_price: @cart.calculate_total_price)
		Cart.create(user_id: @cart.user.id)
		redirect_to "/users/#{@cart.user.id}"
	end
end
