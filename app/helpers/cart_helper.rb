module CartHelper
	def subtotal_helper(items)
		#cart_itemとorder_itemに有効
		subtotal = 0 #宣言が必要らしい
		items.each do |item|
			subtotal += taxed_price_helper(item.product) * item.item_number
		end
		return subtotal #returnで指定しないと表示が変だった
	end
	def total_items_helper(items)
		total_items = 0 #宣言が必要らしい
		items.each do |item|
			total_items += item.item_number
		end
		return total_items #returnで指定しないと表示が変だった
	end
end
