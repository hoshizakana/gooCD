class CartController < ApplicationController

# カート内商品の一覧
  def index
		@items = CartItem.where()
  end


	def create
		# 商品詳細画面で「カートに入れる」ボタンを押したときに動作する、新しいカート商品を保存する
		cart_item = CartItem.new(cart_item_params)
		cart_item = cart_item.item_number.to_i # 一応入れておきます
		cart_item = save
		flash[:notice] = "カートに入れました。"
		redirect_to ("/user/products/#{@product.id}") # 商品一覧から正しくproductが渡されるか？
	end
	def update
		# カート画面で、数量変更を送った時に動作する
		cart_item = CartItem.find(params[:id])
		cart_item.update(cart_item_params)
		flash[:notice] = "更新しました。"
		redirect_to ("/carts/#{current_user.id}")
	end
	def destroy
		# カート画面で、削除を送った時に動作する
		cart_item = CartItem.find(params[:id])


	private
	def cart_item
		params.require(:cart_item).premit(:user_id, :product_id, item_number)
	end

end
