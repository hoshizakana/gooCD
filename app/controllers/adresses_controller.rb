class AdressesController < ApplicationController

	def create
		address = Address.new(address_params)
		if address.save
			notice: "保存しました"
		else
			notice: "住所の保存に失敗しました。"
		end
		# この辺もヘルパーにはじき出せるのかな？
		@order = Order.new
		@cart_items = CartItem.where(user_id: current_user.id)
		@address = Address.where(user_id: current_user.id)
		@address_new = Address.new
		###
		render "/orders/#{current_user.id}"
	end

	def destroy
		address = Address.find(params[:id])
		address.destroy
		# この辺もヘルパーにはじき出せるのかな？
		@order = Order.new
		@cart_items = CartItem.where(user_id: current_user.id)
		@address = Address.where(user_id: current_user.id)
		@address_new = Address.new
		###
		render "/orders/#{current_user.id}"
	end

	private
	def address_params
		params.require(:address).permit(:user_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone)
	end
end
