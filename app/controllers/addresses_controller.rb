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
			redirect_to "/users/#{@current_user.id}"
		else
			render :new
		end

	end

	def destroy
		address = Address.find(params[:id])
		address.destroy
		redirect_to "/users/#{current_user.id}"
	end

	private
	def address_params
		params.require(:address).permit(:user_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone)
	end
end
