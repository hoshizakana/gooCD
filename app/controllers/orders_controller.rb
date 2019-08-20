class OrdersController < ApplicationController
  def procedure
		@cart_items = CartItem.where(user_id: current_user.id)
		@addresses = Address.where(user_id: current_user.id)
		@address_new = Address.new
  end
	def create_addresses
		address = Address.new(address_params)
		address.save
		render process
	end

  def confirm
		@order = Order.new
  end
	def create
		order = Order.new(order_params)
		order.save
		cart_items = CartItem.where(user_id: current_user.id)
		cart_items.each do |cart_item|
			order_item = OrderItem.new
			order_item.product_id = cart_item.product_id
			order_item.item_number = cart_item.item_number
			order_item.user_id = current_user.id
			order_item.order_id = order.id
			order_item.save
			cart_item.delete #なんか違うかこれ？
		end
		redirect_to ("/order/complete")
	end

  def complete

  end


	private
	def order_params
		params.require(:order).permit(
			:user_id, # current_user.id
			:shipping_status, # "発送準備中"
			:last_name, # current_user.last_name
			:first_name, # 同様
			:last_name_kana, # 同様
			:first_name_kana, # 同様
			:postal_code, # 同様
			:address, #ここが問題だな
			:phone, # 同様
			:total_price, # subtotal_helper(cart_items)+500
		)
	end
	def order_items_params
		params.require(:order_item).permit(
			:product_id, # cart_item.product_id
			:order_number, # cart_item.item_number
			:order_id,
			:price, # taxed_price_helper(cart_item.product)*cart_item.item_number
		)
	end
	def address_params
		params.require(:address).permit(
			:user_id, # current_user.id
			:last_name, # formから
			:first_name, # 同様
			:last_name_kana, # 同様
			:first_name_kana, # 同様
			:postal_code, # 同様
			:address, # 同様
			:phone, # 同様
		)
	end
end
