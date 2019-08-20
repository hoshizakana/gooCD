module CartHelper
	def subtotal_helper(cart_items)
		subtotal = 0 #宣言が必要らしい
		cart_items.each do |cart_item|
			subtotal += taxed_price_helper(cart_item.product)*cart_item.item_number
		end
		return subtotal #returnで指定しないと表示が変だった
	end
	def total_items_helper(cart_items)
		total_items = 0 #宣言が必要らしい
		cart_items.each do |cart_item|
			total_items += cart_item.item_number
		end
		return total_items #returnで指定しないと表示が変だった
	end
end
