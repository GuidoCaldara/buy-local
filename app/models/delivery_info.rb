class DeliveryInfo < ApplicationRecord
  belongs_to :order
  has_one :user, through: :order
  after_create :mark_cart_as_complete
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :street, presence: true, length: { maximum: 40 }
  validates :zip_code, presence: true, length: { maximum: 8 }
  validates :city, presence: true, length: { maximum: 30 }
  validates :state, presence: true, length: { maximum: 30 }
  validates :notes, length: { maximum: 200 }
  validates :email, presence: true, length: { maximum: 30 }
  validates :phone_number, length: { minimum: 9, maximum: 10 }

  def mark_cart_as_complete
    self.order.cart.update(completed: true)
  end

end
