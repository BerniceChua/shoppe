class CartsProductsController < ApplicationController
	def new
	end

	def update
		params.require(:carts_product).permit(:quantity, :id, :cart_id, :product_id)
		@cart_product = CartsProduct.find(params[:id])

		if @cart_product.update_attributes(quantity: params[:carts_product][:quantity].to_i)
			redirect_to "/carts/#{@cart_product.cart_id}/edit"
		else
			redirect_to "/carts/#{@cart_product.cart_id}/edit"
		end
	end

	def create
		@cart = Cart.find_by({user_id: params[:user_id], active?: true})
		cart_product = CartsProduct.create({product_id: params[:product_id], cart_id: @cart.id})

		if request.xhr?
		else
			redirect_to @cart
		end

	end

	def checkout
		@cart = Cart.find(params[:id])
		if @cart.cart_not_empty
			@cart.products.each do |product|
				quantity_purachased = CartsProduct.find_by({product_id: product.id, cart_id: @cart.id}).quantity
				product.reduce_inventory_after_checkout(quantity_purachased)
			end
			@cart.update_attributes(active?: false, total_price: @cart.calculate_total_price)
			Cart.create(user_id: @cart.user.id)
			flash[:success] = "Thanks for Ordering!"
		else
			#display error here
		end
		redirect_to "/users/#{@cart.user.id}"
	end

	def destroy
		@cart_product = CartsProduct.find(params[:id])
		cart_product_id = @cart_product.cart_id
		@cart_product.destroy!
		redirect_to "/carts/#{cart_product_id}/edit"
	end

end
