module ApplicationHelper
	def taxed_price_helper(product)
		taxed_price = product.price * 1.08
		taxed_price.floor
	end
end
