module ProductsHelper

def product_in_stock?(product)
	product.inventory > 0
end

end
