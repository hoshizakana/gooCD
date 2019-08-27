class CartController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:index]

  def index
		# カート内商品の一覧
		@cart_items = CartItem.where(user_id: current_user.id)
  end

	def create
		#既に登録済みのカートアイテムを検索し、cart_itemに代入
		cart_item = CartItem.where(user_id: current_user.id).where(product_id: cart_item_params[:product_id])

		# もし登録済みのカートアイテムがあったら、登録済みのカートアイテムの数量に1を足す
		if cart_item.present?
			cart_item[0].item_number += 1
			cart_item[0].save
			flash[:success] = "「#{cart_item[0].product.name}」をカートに追加しました。"
			redirect_to ("/products/#{cart_item[0].product_id}") # 商品一覧から正しくproductが渡されるか？
			else
		# 登録済みのカートアイテムがない場合、新たにカートアイテムを作成
		cart_new_item = CartItem.new(cart_item_params)
		cart_new_item.user_id = current_user.id
		cart_new_item.item_number = 1
		cart_new_item.save
    flash[:success] = "「#{cart_new_item.product.name}」をカートに追加しました。"
		redirect_to ("/products/#{cart_new_item.product_id}") # 商品一覧から正しくproductが渡されるか？
		end
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
	def correct_user
		@user = User.find(params[:user_id])
		if current_user.id != @user.id
			redirect_to "/"
		end
	end
end
