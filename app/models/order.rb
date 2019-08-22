class Order < ApplicationRecord
  validates :user_id, :shipping_status, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone, :total_price, presence: true
	belongs_to :user
	has_many :order_items, dependent: :destroy
end
