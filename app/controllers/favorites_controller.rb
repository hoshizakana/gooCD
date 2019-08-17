class FavoritesController < ApplicationController
  before_action :set_variables

  def favorite
    favorite = current_user.favorites.new(product_id: @product.id)
    favorite.save
  end

  def unfavorite
    favorite = current_user.favorites.find_by(product_id: @product.id)
    favorite.destroy
  end

  private
  def set_variables
    @product = Product.find(params[:product_id])
    @id_name = "#favorite-link-#{@product.id}"
  end

end
