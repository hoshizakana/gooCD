class CartItem < ApplicationRecord
  validates :user_id, :product_id, :item_number, presence: true
	belongs_to :product
	belongs_to :user
end
