class OrderItem < ApplicationRecord
  validates :prduct_id, :order_number, :order_id, :price, presence: true
	belongs_to :product
end
