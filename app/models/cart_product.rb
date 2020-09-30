class CartProduct < ApplicationRecord
  monetize :price_cents
  belongs_to :cart
  has_one :order, through: :cart
  belongs_to :product
  before_validation :calculate_price
  after_destroy :destroy_cart_if_empty
  after_update :re_calculate_total_price
  validates :price_cents, presence: true, numericality: { greater_than: 0 }
  validates :price_cents, presence: true,  numericality: { only_integer: true, greater_than: 0, less_than: 50000 }


  def re_calculate_total_price
    if !self.order.nil?
      #self.order.update(cart_amount_cents: CartProduct.where(cart_id: self.cart).pluck(:price_cents).reduce(:+))
      self.order.update(cart_amount_cents: self.cart.products_total_price)
    end
  end

  def calculate_price
    p_price_cents = self.product.discounted_price_cents != 0 ?  self.product.discounted_price_cents : self.product.price_cents
    self.price_cents = (self.quantity.to_i * p_price_cents)
  end

  def destroy_cart_if_empty
    self.cart.order.destroy if self.cart.order
    self.cart.destroy if self.cart.cart_products.empty?
  end
end
