class HomesController < ApplicationController
  def top
    @total_ranking = Product.limit(3)
		@jpops3 = Product.where(genre_id: 1).limit(3)
		@rocks3 = Product.where(genre_id: 2).limit(3)
		# @fav_ranks = Product.find(Like.group(:product_id).order('count(product_id) desc').limit(3).pluck(:product_id))
			@all_ranked_product = Product.find(Favorite.group(:product_id).order('count(product_id) desc').pluck(:product_id))
  end

	def ranking
		
			@ranked_product = Product.create_ranks(params[:genre_id]) #ランキングの計算ロジックはモデルメソッドとしてproduct.rbに記述

  end
end
