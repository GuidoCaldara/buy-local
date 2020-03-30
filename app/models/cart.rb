class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many :cart_products, dependent: :destroy
  has_one :order

  def total_price
    self.cart_products.pluck(:price_cents).reduce(:+)
  end
end
