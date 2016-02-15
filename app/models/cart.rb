class Cart < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :products

	validates :total_price, numericality: {greater_than_or_equal_to: 0}
	validate :cart_not_empty

	def calculate_total_price
		total = 0
		self.products.each do |prod|
			total += prod.calculate_quantity(self) * prod.price
		end
		return total
	end

	def item_in_stock?
	end

	def not_active
	end


	def cart_not_empty
		self.products.length > 0
	end




end
