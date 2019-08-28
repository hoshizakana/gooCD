class Product < ApplicationRecord
	include CommonModule

  attachment :image
  has_many :songs, dependent: :destroy
  has_many :favorites, dependent: :destroy
	has_many :cart_item
	has_many :order_item
  belongs_to :genre
  belongs_to :artist
  belongs_to :label
  accepts_nested_attributes_for :songs, allow_destroy: true
  paginates_per 30
#release_dateはseedの入れ方わかってないので、今はバリデーション外してます。
  validates :name, :artist_id, :label_id, :genre_id, :status, :price, :stock, presence: true

 # def favorited_by?(user)
 #   favorites.find(user_id: user.id).exists?
 # end

  #ランキングの計算ロジック
  def self.create_ranks(genre_id)
    if genre_id
      all_ranked_product = Product.includes(:artist, :favorites, :genre).find(Favorite.group(:product_id).order('count(product_id) desc').pluck(:product_id))
      all_ranked_product.select{ |product| product.genre_id == genre_id.to_i }
      #現状だと、ジャンルごとの商品の数だけランキングが表示されてしまう。数を50までに制限したいが、limitメソッドは使えない…。
      #なんとか方法を考えたい！
    else
      Product.includes(:artist, :favorites, :genre).find(Favorite.group(:product_id).order('count(product_id) desc').limit(50).pluck(:product_id))
    end
  end


	# priceを税込価格で返す
	def taxed_price
		tp = self.price * consumption_tax # defined at models/concerns/common_module.rb
		return tp.ceil
	end

end
