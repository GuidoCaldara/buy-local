class Store < ApplicationRecord
  belongs_to :shop
  has_many :products
end
