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
  before_validation :set_country
  validates :name, presence: true, length: { minimum: 5, maximum: 40 }
  validates :description, presence: true, length: { minimum: 20, maximum: 600 }
  validates :street, presence: true, length: { minimum: 5, maximum: 40 }
  validates :zip_code, presence: true, length: { is: 6 }
  validates :city, presence: true, length: { minimum: 3, maximum: 40 }
  validates :state, presence: true, length: { minimum: 3, maximum: 40 }
  validates :street_number, presence: true, length: { minimum: 1, maximum: 3 }
  validates :phone_number, presence: true, length: { minimum: 7, maximum: 12 }
  validates :delivery_fee_cents, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 4000 }
  validates :free_delivery_threshold_cents, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 40000 }
  validate :free_delivery_threshold_bigger_than_delivery_fee
  validates :delivery_time, numericality: { only_integer: true}, inclusion: { :in => [24, 48, 72, 96, 120]}
  before_save :check_geocode

  def set_country
    self.country = "Italy"
  end

  def check_geocode
    if self.latitude == nil || self.longitude == nil
      error.add(:address, "Inserisci un indirizzo corretto")
    end
  end

  def free_delivery_threshold_bigger_than_delivery_fee
    return if free_delivery_threshold_cents == 0
    if free_delivery_threshold_cents < delivery_fee_cents
      error.add(:free_delivery_threshold_cents, "L'importo minimo per la consegna gratuita non può essere inferiore alle spese di spedizione standard")
    end
  end

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
