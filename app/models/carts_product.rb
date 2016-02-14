class CartsProduct < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	validates :quantity, numericality: {greater_than_or_equal_to: 0}

	# validate :quantity_less_than_inventory

	# def quantity_less_than_inventory
	# 	if self.quantity > Product.find(self.product_id).inventory
	# 		errors.add(:quantity, 'can not buy more than in inventory')
	# 	end
	# end
	def calculate_price_of_item_in_cart
		product = CartsProduct.find_by(self.id).price
		self.quantity*product
	end

	def checkout_cart
		# self.active? = false
	end

end
