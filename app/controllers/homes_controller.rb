class HomesController < ApplicationController
  def top
    @total_ranking = Product.limit(3)
		@jpops3 = Product.where(genre_id: 1).limit(3)
		@rocks3 = Product.where(genre_id: 2).limit(3)
		# @fav_ranks = Product.find(Like.group(:product_id).order('count(product_id) desc').limit(3).pluck(:product_id))
			@all_ranked_product = Product.find(Favorite.group(:product_id).order('count(product_id) desc').pluck(:product_id))
  end

  def ranking
			@genre_id = params[:genre_id]
			@all_ranked_product = Product.find(Favorite.group(:product_id).order('count(product_id) desc').pluck(:product_id))
			@genre_ranked_product = @all_ranked_product.select{ |product| product.genre_id == params[:genre_id].to_i }
			
  end
end
