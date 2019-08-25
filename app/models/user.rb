class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        validates :last_name, presence: true
        validates :first_name, presence: true
        validates :last_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
        validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
        validates :postal_code, presence: true
        validates :adress, presence: true
        validates :phone, presence: true

         has_many :addresses, dependent: :destroy
				 has_many :cart_items, dependent: :destroy
				 has_many :order, dependent: :destroy
         has_many :favorites, dependent: :destroy
end
