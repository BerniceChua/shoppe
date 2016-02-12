class CartProduct < ActiveRecord::Base
	has_many :carts, :products

	validates :quantity, numericality: {greater_than_or_equal_to: 0}

	validate :quantity_less_than_inventory

	def quantity_less_than_inventory
		if self.quantity > Product.find(self.product_id).inventory
			errors.add(:quantity, 'can not buy more than in inventory')
		end
	end

end
