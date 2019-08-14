class Product < ApplicationRecord
  attachment :image
  has_many :songs, dependent: :destroy
  belongs_to :artist
  accepts_nested_attributes_for :songs
end
