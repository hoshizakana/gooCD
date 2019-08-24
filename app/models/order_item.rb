class OrderItem < ApplicationRecord
	include CommonModule

  validates :product_id, :item_number, :order_id, :price, presence: true
	belongs_to :product
	belongs_to :order

	# priceを税込価格で返す
	def taxed_price
		tp = self.price * consumption_tax # defined at models/concerns/common_module.rb
		return tp.ceil
	end
end
