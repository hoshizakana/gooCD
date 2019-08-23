class OrderItem < ApplicationRecord
  validates :prduct_id, :order_number, :order_id, :price, presence: true
	belongs_to :product
	belongs_to :order

	# validatesでpresence:trueしないでください
	# →admin/orders/editでの入れ子フォームでのeditの為
	# 参考：https://ruby-rails.hatenadiary.com/entry/20141208/1418018874
end
