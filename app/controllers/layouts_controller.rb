class LayoutsController < ApplicationController
	def load
		@categoriesDropdown = Category.all
	end
end
