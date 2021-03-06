class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
