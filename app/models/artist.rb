class Artist < ApplicationRecord
  has_many :products, dependent: :destroy
end
