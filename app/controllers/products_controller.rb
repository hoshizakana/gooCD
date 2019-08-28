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
    @productsitem = Product.where(artist_id: (@product.artist_id))
    @products = @productsitem.page(params[:page]).per(6)
    @product_show = @products.where(@product.artist_id.to_s)
		# @cart_item = CartItem.new
      #-> form使わずにlinktoで飛ばすので、cart_itemを渡すことは不可能
  end


  def search_params
    params.require(:product).permit(:artist_id)
  end

end
