class AdminOrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
		@search = Order.ransack(params[:q])
		@result = @search.result.page(params[:page]).per(10).order('updated_at desc')
  end

  def show
		@order = Order.find(params[:id])
		@order_items = OrderItem.where(order_id: @order.id)
  end

  def edit
		@order = Order.find(params[:id])
		@order_items = OrderItem.where(order_id: @order.id)
		@products_number = Product.all.count
		@order_item = OrderItem.new
  end
	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			flash[:success] = "受注情報の編集が完了しました"
			redirect_to ("/admin/orders/#{@order.id}")
		else
			render :edit
		end
	end


	# order_item
	def order_item_create
		order_item = OrderItem.new(order_item_params)
		order_item.order_id = params[:id]
		order_item.product_id = order_item_params[:product_id]
		order_item.price = order_item.product.price
		order_item.item_number = 1
		order_item.save
		redirect_to ("/admin/orders/#{params[:id]}/edit")
	end
	def order_item_update
		order_item = OrderItem.find(params[:order_item_id])
		if order_item.update(order_item_params)
			flash[:notice] = "受注商品情報の編集が完了しました"
			redirect_to ("/admin/orders/#{order_item.order_id}")
		else
			render :edit
		end
	end
	def order_item_destroy
		order_item = OrderItem.find(params[:order_item_id])
		order_item.destroy
		redirect_to ("/admin/orders/#{params[:id]}/edit")
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
			:payment,
			order_items_attributes: [:id, :product_id, :item_number, :price]
		)
	end
	def order_item_params
		params.require(:order_item).permit(:product_id)
	end
end
