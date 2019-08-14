class Product < ApplicationRecord
  attachment :image
  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs
end
