class ProductsController < ApplicationController
  def index
    if @searched_products
      @products = @searched_products.where(is_deleted: ["false"]).page(params[:page]).reverse_order
    else
      @products = Product.where(is_deleted: ["false"]).page(params[:page]).reverse_order
    end
  end

  def show
    @product = Product.find(params[:id])
    # @products = Product.all
    # @product_show = @products.artists.where(params[:id])
		# @cart_item = CartItem.new
			#-> form使わずにlinktoで飛ばすので、cart_itemを渡すことは不可能
  end

  def search
  end

end
