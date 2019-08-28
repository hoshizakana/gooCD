class Order < ApplicationRecord
  validates :user_id, :shipping_status, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone, :total_price, presence: true
	belongs_to :user
	has_many :order_items, dependent: :destroy
	accepts_nested_attributes_for :order_items, allow_destroy: true
	# a_n_a_fで「reject_if: all_blank」とすると、order_itemなしでorderが保存できるようになる

	def set_order(index, user_id)
		current_user = User.find(user_id)
		if index.to_i == 0
			self.last_name = current_user.last_name
			self.first_name = current_user.first_name
			self.last_name_kana = current_user.last_name_kana
			self.first_name_kana = current_user.first_name_kana
			self.postal_code = current_user.postal_code
			self.address = current_user.adress
			self.phone = current_user.phone
		else
			adr = Address.find(index.to_i)
			self.last_name = adr.last_name
			self.first_name = adr.first_name
			self.last_name_kana = adr.last_name_kana
			self.first_name_kana = adr.first_name_kana
			self.postal_code = adr.postal_code
			self.address = adr.address
			self.phone = adr.phone
		end
  end



end
