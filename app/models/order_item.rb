class OrderItem < ApplicationRecord
	belongs_to :product
	belongs_to :order

	# validatesでpresence:trueしないでください
	# →admin/orders/editでの入れ子フォームでのeditの為
	# 参考：https://ruby-rails.hatenadiary.com/entry/20141208/1418018874
end
