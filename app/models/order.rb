class Order < ApplicationRecord
  monetize :amount_cents
  belongs_to :cart
  has_many :cart_products, through: :cart
  has_one :user, through: :cart
  has_one :store, through: :cart
  has_one :merchant, through: :store
  has_one :delivery_info, dependent: :destroy
  before_create :generate_order_number
  after_create :mark_cart_as_complete
  before_validation :set_total_price

  def set_total_price
    self.amount_cents = self.cart.total_price
  end
  def mark_cart_as_complete
    self.cart.update(completed: true)
  end
  def generate_order_number
    self.number = loop do
      random_token = ('A'..'Z').to_a.sample(4).join
      2.times { random_token.insert(rand(0..4), rand(0..9).to_s) }
      break random_token if Order.where(number: random_token)
    end
  end
end
