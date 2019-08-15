class HomesController < ApplicationController
  def top
    @total_ranking = Product.limit(3)
		@jpops3 = Product.where(genre_id: 1).limit(3)
		@rocks3 = Product.where(genre_id: 2).limit(3)
		@genres = Genre.all
		# @fav_ranks = Product.find(Like.group(:product_id).order('count(product_id) desc').limit(3).pluck(:product_id))
  end

  def ranking
			@ranking = Product.where(genre_id: 1).limit(50)
			@genres = Genre.all
		# @fav_ranks = Product.find(Like.group(:product_id).order('count(product_id) desc').limit(3).pluck(:product_id))
		# @fav_ranks_genre = @fav_ranks.select{ |product| product.genre_id == id } # どうやってgenreIDを渡すんだっけ？
		# あとでモデルのメソッドに移したい
  end
end
