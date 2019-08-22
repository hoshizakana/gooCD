class Address < ApplicationRecord
  validates :user_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone, presence: true
    belongs_to :user
end
