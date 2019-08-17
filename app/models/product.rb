class Product < ApplicationRecord
  attachment :image
  has_many :songs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  belongs_to :artist
  belongs_to :label
  accepts_nested_attributes_for :songs

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #削除フラグ用
  #scope :active,where(deleted:false)

end
