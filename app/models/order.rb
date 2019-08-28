class Order < ApplicationRecord
  validates :user_id, :shipping_status, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone, :total_price, presence: true
	belongs_to :user
	has_many :order_items, dependent: :destroy
	accepts_nested_attributes_for :order_items, allow_destroy: true
	# a_n_a_fで「reject_if: all_blank」とすると、order_itemなしでorderが保存できるようになる

	def set_order(index)
		if index.to_i == 0
			@order.last_name = current_user.last_name
			@order.first_name = current_user.first_name
			@order.last_name_kana = current_user.last_name_kana
			@order.first_name_kana = current_user.first_name_kana
			@order.postal_code = current_user.postal_code
			@order.address = current_user.adress
			@order.phone = current_user.phone
		else
			adr.Address.find(index.to_i)
			@order.last_name = adr.last_name
			@order.first_name = adr.first_name
			@order.last_name_kana = adr.last_name_kana
			@order.first_name_kana = adr.first_name_kana
			@order.postal_code = adr.postal_code
			@order.address = adr.address
			@order.phone = adr.phone
		end




end
