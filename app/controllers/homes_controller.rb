class HomesController < ApplicationController
  def top
    #@total_ranking = Product.limit(3)
		#@jpops3 = Product.where(genre_id: 1).limit(3)
		#@rocks3 = Product.where(genre_id: 2).limit(3)
    @genres = Genre.all
    @all_ranked_product = Product.find(Favorite.group(:product_id).order('count(product_id) desc').pluck(:product_id))
    @jpop_rank = @all_ranked_product.select{ |product| product.genre_id == 1.to_i }
    @rock_rank = @all_ranked_product.select{ |product| product.genre_id == 3.to_i }
  end

	def ranking
		
			@ranked_product = Product.create_ranks(params[:genre_id]) #ランキングの計算ロジックはモデルメソッドとしてproduct.rbに記述

  end
end
