class CartController < ApplicationController
	before_action :authenticate_user!

  def index
		# カート内商品の一覧
		@cart_items = CartItem.where(user_id: current_user.id)
  end

	def create
		# 商品詳細画面で「カートに入れる」ボタンを押したときに動作する、新しいカート商品を保存する
		cart_item = CartItem.new(cart_item_params)
		cart_item.user_id = current_user.id
		cart_item.item_number = 1
		cart_item.save
    flash[:success] = "「#{cart_item.product.name}」をカートに入れました。"
		redirect_to ("/products/#{cart_item.product_id}") # 商品一覧から正しくproductが渡されるか？
	end
	def update
		# カート画面で、数量変更を送った時に動作する
		cart_item = CartItem.find(params[:id])
		cart_item.update(cart_item_number_params)
		flash[:notice] = "更新しました。"
		redirect_to ("/carts/#{current_user.id}")
	end
	def destroy
		# カート画面で、削除を送った時に動作する
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
    flash[:warning] = "「#{cart_item.product.name}」をカートから出しました。"
		redirect_to ("/carts/#{current_user.id}")
	end

	private
	def cart_item_params
		params.permit(:user_id, :product_id, :item_number)
	end
	def cart_item_number_params
		params.require(:cart_item).permit(:item_number)
	end
end
