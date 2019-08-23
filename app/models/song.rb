class Song < ApplicationRecord
  validates :name, :disk, presence: true
  belongs_to :product
end
