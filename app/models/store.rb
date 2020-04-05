class Store < ApplicationRecord
  DELIVERY_TIME_OPTIONS = [["24 Ore - 1 Giorno Lavorativo", 1], ["48 Ore - 2 Giorni Lavorativi", 2], ["72 ore - Tre giorni Lavorativi", 3], ["96 ore - Quattro Giorni Lavorativi", 4]]
  belongs_to :merchant
  has_many :products
  has_many :categories, through: :products
  has_many :carts
  has_many :store_pictures
  has_many_attached :photos
  has_many :orders, through: :carts
  monetize :delivery_fee_cents
  monetize :free_delivery_threshold_cents
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.street_changed? }

  def categories_name
    self.categories.pluck(:name).uniq
  end

  def full_address
    [street, street_number, city, state, country].compact.join(', ')
  end

  def available_products
    Product.where(store: self, available: true)
  end

  def paid_orders
    self.orders.where(status: 'paid')
  end

  def in_delivering_orders
    self.orders.where(status: 'delivered')
  end

  def completed_orders
    self.orders.where(status: 'completed')
  end



end
