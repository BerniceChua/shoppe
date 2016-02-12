class Cart < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :products

	validates :total_price, numericality: {greater_than_or_equal_to: 0}

	def calculate_total_price

	end

	def item_in_stock?
	end

	def not_active
	end
end
