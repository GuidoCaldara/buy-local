class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many :cart_products, dependent: :destroy
  has_one :order
  validate :one_active_cart_user_store



  def products_total_price
    self.cart_products.pluck(:price_cents).reduce(:+).to_f
  end

  def one_active_cart_user_store
    if Cart.find_by(user: self.user, store: self.store, completed: false)
      error.add(:user_id, "Somethin went wrong")
    end
  end
end
