class DeliveryInfo < ApplicationRecord
  belongs_to :order
  has_one :user, through: :order
  after_create :mark_cart_as_complete

  def mark_cart_as_complete
    self.order.cart.update(completed: true)
  end

end
