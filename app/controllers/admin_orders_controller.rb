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

		if (@order.shipping_status != order_params[:shipping_status]) && (order_params[:shipping_status] == "キャンセル")
			order_items = OrderItem.where(order_id: @order.id)
			order_items.each do |order_item|
				product = Product.find(order_item.product_id)
				product.stock += order_item.item_number
				product.update(:stock=>product.stock)
			end
		
		elsif (@order.shipping_status == "キャンセル") && (order_params[:shipping_status] == "発送準備中" ||order_params[:shipping_status] == "発送済み" ) 
			order_items = OrderItem.where(order_id: @order.id)
			order_items.each do |order_item|
				product = Product.find(order_item.product_id)
				product.stock -= order_item.item_number

				if product.stock < 0
					flash[:waraning] = "在庫を0未満で登録することはできません。"
					render :edit
				else
					product.update(:stock=>product.stock)
				end
      end
		end

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
		@order = Order.find(params[:id])
		@order_items = OrderItem.where(order_id: @order.id)
		@order_item = OrderItem.new
		@products_number = Product.all.count
		order_item = OrderItem.find(params[:order_item_id])
		
		if order_item_params[:item_number].to_i != order_item.item_number
			dif = order_item.item_number - order_item_params[:item_number].to_i

			product = Product.find(order_item.product_id)
			product.stock += dif

				if product.stock <0
					flash[:warning] = "在庫を0未満で登録することはできません。"
					render :edit

				else
					product.update(:stock => product.stock)


					if order_item.update(order_item_params)
						flash[:success] = "受注商品情報の編集が完了しました。"
						redirect_to ("/admin/orders/#{order_item.order_id}")
					else
						flash[:warning] = "保存に失敗しました。"
						render :edit
					end

				end	
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
		params.require(:order_item).permit(:product_id, :item_number)
	end
end
