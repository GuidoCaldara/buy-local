class CartProduct < ApplicationRecord
  monetize :price_cents
  belongs_to :cart
  has_one :order, through: :cart
  belongs_to :product
  before_save :calculate_price
  after_destroy :destroy_cart_if_empty
  after_update :re_calculate_total_price

  def re_calculate_total_price
    if !self.order.nil?
      self.order.update(cart_amount_cents: CartProduct.where(cart_id: self.cart).pluck(:price_cents).reduce(:+))
    end
  end

  def calculate_price
    product_price = self.product.discounted_price_cents != 0 ?  self.product.discounted_price_cents : self.product.price_cents
    self.price = (self.quantity.to_i * product_price).to_f / 100
  end

  def destroy_cart_if_empty
    self.cart.order.destroy if self.cart.order
    self.cart.destroy if self.cart.cart_products.empty?
  end
end
