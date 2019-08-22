class Song < ApplicationRecord
  validates :product_id, :name, :disk, presence: true
  belongs_to :product
end
