class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @all_ranked_product = Product.create_ranks(params[:genre_id])
    @jpop_rank = @all_ranked_product.select{ |product| product.genre_id == 1.to_i }
    @rock_rank = @all_ranked_product.select{ |product| product.genre_id == 3.to_i }
  end

  def ranking
      @ranked_product = Product.includes([:artist,:genre]).create_ranks(params[:genre_id])#ランキングの計算ロジックはモデルメソッドとしてproduct.rbに記述
      @genres = Genre.all
      if params[:genre_id]
        @genre = Genre.find(params[:genre_id])
      end
  end
end
