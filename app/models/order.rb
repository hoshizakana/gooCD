class Order < ApplicationRecord
  validates :user_id, :shipping_status, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone, :total_price, presence: true
	belongs_to :user
	has_many :order_items, dependent: :destroy
	accepts_nested_attributes_for :order_items, allow_destroy: true
	# a_n_a_fで「reject_if: all_blank」とすると、order_itemなしでorderが保存できるようになる
end
