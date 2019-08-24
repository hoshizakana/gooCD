class OrdersController < ApplicationController
  def procedure
		@order = Order.new
		@cart_items = CartItem.where(user_id: current_user.id)
		if @cart_items.nil?
			redirect_to ("/"), notice: "カートに商品がありません。"
		end
		@addresses = Address.where(user_id: current_user.id)
  end

  def confirm
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
			adr = Address.find(order_params[:address].to_i)
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

	def create
		cart_items = CartItem.where(user_id: current_user.id)
		if cart_items.nil?
			# cart_itemが空だったらredirect_to top
			redirect_to ("/cart/#{current_user.id}"), notice: "カートに商品がありません"
		else
			#受け取ったaddress.idから、送り先を探し内容を保存しなおす
			order = Order.new(order_params)
			order.user_id = current_user.id
			order.shipping_status = "発送準備中"
			order.total_price = total_price_helper(cart_items)
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
			# Order.saveしてからOrderItemにidを入れる
			# binding.pry
			if order.save
			# order.save
				cart_items.each do |cart_item|
					#適合するcart_itemを取り出し、一つ一つをorder_itemに登録する
					order_item = OrderItem.new
					order_item.product_id = cart_item.product_id
					order_item.item_number = cart_item.item_number
					order_item.order_id = order.id
					order_item.price = order_item.product.price
					order_item.save
					cart_item.destroy #移したカートアイテムを削除する
				end
				redirect_to ("/orders/complete") #購入完了ページへ
			else
				# redirect_to ("/orders/#{current_user.id}") #購入失敗時、オーダートップへ
			end
		end
	end

  def complete
  end

	private
	def order_params
		params.require(:order).permit(
			:user_id,
			:shipping_status,
			:last_name,
			:first_name,
			:last_name_kana,
			:first_name_kana,
			:postal_code,
			:address,
			:phone,
			:total_price,
			:payment
		)
	end
	def order_items_params
		params.require(:order_item).permit(
			:product_id,
			:order_number,
			:order_id,
			:price
		)
	end
	def address_params
		params.require(:address).permit(
			:user_id,
			:last_name,
			:first_name,
			:last_name_kana,
			:first_name_kana,
			:postal_code,
			:address,
			:phone
		)
	end
end
