class CartsProductsController < ApplicationController
	def new
	end

	def update
		params.require(:carts_product).permit(:quantity, :id, :cart_id, :product_id)
		@cart_product = CartsProduct.find(params[:id])

		p "#" * 100
		p params[:id]
		p @cart_product
		p params[:carts_product][:quantity]
		p "#" * 100

		@cart_product.update_attributes(quantity: params[:carts_product][:quantity].to_i)




		# if @cart.update(cart_params)
		# 	CartsProduct.find_by(cart_id: @cart.id, product_id: prod.id).quantity
		# end

		redirect_to Cart.find(@cart_product.cart_id)
	end

	def create
		# puts "THESE ARE THE PARAMS"
		# puts params
	end
end
