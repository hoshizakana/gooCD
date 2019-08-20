class Product < ApplicationRecord
  attachment :image
  has_many :songs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  belongs_to :artist
  belongs_to :label
  accepts_nested_attributes_for :songs, allow_destroy: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #ランキングの計算ロジック
  def self.create_ranks(genre_id)
    if genre_id 
      all_ranked_product = Product.find(Favorite.group(:product_id).order('count(product_id) desc').pluck(:product_id))
      all_ranked_product.select{ |product| product.genre_id == genre_id.to_i }
      #現状だと、ジャンルごとの商品の数だけランキングが表示されてしまう。数を50までに制限したいが、limitメソッドは使えない…。
      #なんとか方法を考えたい！
    else
      Product.find(Favorite.group(:product_id).order('count(product_id) desc').limit(50).pluck(:product_id))
    end
  end

  #削除フラグ用
  #scope :active,where(deleted:false)

end
