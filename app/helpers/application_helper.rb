module ApplicationHelper
	# models/products.rb, order_itemにてtaxed_priceを定義


	def price_multiple_helper(item) # cart_item or order_item
		# 1商品あたりの計、税別価格×数量
		multipled_price = 0
		if item.attribute_present?(:price)
			# order_itemには注文時価格(item.price)がある
			multipled_price = item.taxed_price * item.item_number
		else
			# cart_itemにカート時価格(item.price)はあってはならない
			# 商品価格を探してくるようにする
			product = Product.find(item.product_id)
			multipled_price = product.taxed_price * item.item_number
		end
		return multipled_price
	end

	def subtotal_price_helper(items) # cart_items or order_items
		# カート・注文の小計を計算する
		subtotal = 0
		if items[0].attribute_present?(:price)
			items.each do |item|
				subtotal += price_multiple_helper(item)
			end
		else
			items.each do |item|
				product = Product.find(item.product_id)
				subtotal += price_multiple_helper(item)
			end
		end
		return subtotal
	end

	def total_price_helper(items) # cart_items or order_items
		return subtotal_price_helper(items) + 500
	end

	def total_items_helper(items) # cart_items or order_items
		# 注文の中での合計点数を返す
		total_items = 0 #宣言が必要らしい
		items.each do |item|
			total_items += item.item_number
		end
		return total_items #returnで指定しないと表示が変だった
	end

end
