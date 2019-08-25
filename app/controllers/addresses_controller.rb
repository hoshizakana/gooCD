class AddressesController < ApplicationController
before_action :authenticate_user!

	def new
		# @address = current_user.addresses.build
		  @address = Address.new
	end

	def create
		@address = Address.new(address_params)
		@address.user_id = current_user.id
		if @address.save
			flash[:notice] = "保存しました"
			# URLのパラメータが 1 の場合、マイページに遷移させる
			if params[:id].to_i == 1
				redirect_to "/users/#{current_user.id}"	

			# URLのパラメータが 2 の場合、購入手続き画面に遷移させる
			elsif params[:id].to_i == 2
				redirect_to "/orders/#{current_user.id}"

			# URLのパラメータが 1 でも 2 でもない場合、マイページに遷移させる
			else
				redirect_to "/users/#{current_user.id}"				
			end		
		else
			render :new
		end

	end

	def destroy
		address = Address.find(params[:id])
		address.destroy
		# URLのパラメータが 1 の場合、マイページに遷移させる
		if params[:screen_type].to_i == 1
			redirect_to "/users/#{current_user.id}"	

		# URLのパラメータが 2 の場合、購入手続き画面に遷移させる
		elsif params[:screen_type].to_i == 2
			redirect_to "/orders/#{current_user.id}"

		# URLのパラメータが 1 でも 2 でもない場合、マイページに遷移させる
		else
			redirect_to "/users/#{current_user.id}"				
		end		
	end

	private
	def address_params
		params.require(:address).permit(:user_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone)
	end
end
