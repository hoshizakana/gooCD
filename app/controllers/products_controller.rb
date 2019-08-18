class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
		# @cart_item = CartItem.new
			#-> form使わずにlinktoで飛ばすので、cart_itemを渡すことは不可能
  end

  def search
  end

end
