class OrdersController < ApplicationController
  def procedure
		@order = Order.new
		@cart_items = CartItem.where(user_id: current_user.id)
		@addresses = Address.where(user_id: current_user.id)
		@address_new = Address.new
  end

  def confirm
		if params[:back]
			redirect_to ("/")
		else
			@order = Order.new(order_params)
			if @order.address.to_i == 0
				@order.last_name = current_user.last_name
				@order.first_name = current_user.first_name
				@order.last_name_kana = current_user.last_name_kana
				@order.first_name_kana = current_user.first_name_kana
				@order.postal_code = current_user.postal_code
				@order.address = current_user.adress
				@order.phone = current_user.phone
			else
				adr = Adress.find(order_params[:address].to_i)
				@order.last_name = adr.last_name
				@order.first_name = adr.first_name
				@order.last_name_kana = adr.last_name_kana
				@order.first_name_kana = adr.first_name_kana
				@order.postal_code = adr.postal_code
				@order.address = adr.address
				@order.phone = adr.phone
			end
		@cart_items = CartItem.where(user_id: current_user.id)
		end
  end

	def create
		#受け取ったaddress.idから、送り先を探し内容を保存しなおす
		if params[:back] #戻るボタンで送信された場合は
			redirect_to ("/order/#{current_user.id}")
		else
			order = Order.new(order_params)
			order.user_id = current_user.id
			order.shipping_status = "発送準備中"

			if order_params[:address].to_i == 0
				order.last_name = current_user.last_name
				order.first_name = current_user.first_name
				order.last_name_kana = current_user.last_name_kana
				order.first_name_kana = current_user.first_name_kana
				order.postal_code = current_user.postal_code
				order.address = current_user.adress
				order.phone = current_user.phone
			else
				adr = Address.find(order_params[:address].to_i)
				order.last_name = adr.last_name
				order.first_name = adr.first_name
				order.last_name_kana = adr.last_name_kana
				order.first_name_kana = adr.first_name_kana
				order.postal_code = adr.postal_code
				order.address = adr.address
				order.phone = adr.phone
			end
			cart_items = CartItem.where(user_id: current_user.id)
			order.total_price = subtotal_helper(cart_items) + 500
			cart_items.each do |cart_item|
				#適合するcart_itemを取り出し、一つ一つをorder_itemに登録する
				order_item = OrderItem.new
				order_item.product_id = cart_item.product_id
				order_item.order_number = cart_item.item_number
				order_item.order_id = order.id
				order_item.save
				cart_item.destroy #移したカートアイテムを削除する
			end
			if order.save
				redirect_to ("/orders/complete") #購入完了ページへ
			else
				redirect_to ("/order/#{current_user.id}") #購入失敗時、オーダートップへ
			end
		end
	end

  def complete
  end

	private
	def order_params
		# binding.pry
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
			:payment #抜けてた
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
			:phone # 同様
		)
	end
end
