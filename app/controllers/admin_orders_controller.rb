class AdminOrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
		@search = Order.ransack(params[:q])
		@result = @search.result.page(params[:page]).per(3)
  end

  def show
		@order = Order.find(params[:id])
		@order_items = OrderItem.where(order_id: @order.id)
  end

  def edit
		@order = Order.find(params[:id])
		@order_items = OrderItem.where(order_id: @order.id)
  end
	def update
		order = Order.find(params[:id])
		order_items = OrderItem.where(order_id: order.id)
		if order.update(order_params) && order_item.update(order_item_params)
			flash[:notice] = "受注情報の編集が完了しました"
			redirect_to ("/admin/orders/#{order.id}")
		else
			render :edit
		end
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
end
