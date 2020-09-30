class Store < ApplicationRecord

  DELIVERY_TIME_OPTIONS = [["24 Ore - 1 Giorno Lavorativo", 24], ["48 Ore - 2 Giorni Lavorativi", 48], ["72 ore - Tre giorni Lavorativi", 72], ["96 ore - Quattro Giorni Lavorativi", 96]]
  belongs_to :merchant
  has_many :products
  has_many :categories, through: :products
  has_many :carts
  has_many :store_pictures
  has_one_attached :logo
  has_many :orders, through: :carts
  monetize :delivery_fee_cents
  monetize :free_delivery_threshold_cents
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.street_changed? }
  before_create :set_country
  validates :name, presence: true, length: { minimum: 5, maximum: 40 }
  validates :description, presence: true, length: { minimum: 20, maximum: 600 }
  validates :street, presence: true, length: { minimum: 5, maximum: 40 }
  validates :zip_code, presence: true, length: { is: 5 }
  validates :city, presence: true, length: { minimum: 3, maximum: 40 }
  validates :state, presence: true, length: { minimum: 3, maximum: 40 }
  validates :street_number, presence: true, length: { minimum: 1, maximum: 3 }
  validates :phone_number, presence: true, length: { minimum: 7, maximum: 12 }
  validates :delivery_fee_cents, presence: true, numericality: { only_integer: true, greater_or_equal_than: 0, less_than: 4000 }
  validates :free_delivery_threshold_cents, presence: true, numericality: { only_integer: true, greater_or_equal_than: 0, less_than: 40000 }
  validate :free_delivery_threshold_bigger_than_delivery_fee
  validate :delivery_cant_be_free_if_free_delivery_threshold_applied
  validates :delivery_time, numericality: { only_integer: true}, inclusion: { :in => [24, 48, 72, 96, 120]}
  after_validation :check_geocode, if: ->(obj){ obj.street_changed? || obj.latitude_changed? || obj.longitude_changed? }


  def set_country
    self.country = "Italy"
  end

  def check_geocode
    if self.latitude == nil || self.longitude == nil
      errors.add(:address, "Inserisci un indirizzo corretto")
    end
  end

  def free_delivery_threshold_bigger_than_delivery_fee
    return if free_delivery_threshold_cents == 0
    if free_delivery_threshold_cents < delivery_fee_cents
      errors.add(:free_delivery_threshold_cents, "L'importo minimo per la consegna gratuita non può essere inferiore alle spese di spedizione standard")
    end
  end

  def delivery_cant_be_free_if_free_delivery_threshold_applied
    if free_delivery_threshold_cents != 0
      if delivery_fee_cents == 0
        errors.add(:delivery_fee_cents, "Hai selezionato un'importo minimo per la consegna gratuita. Le spese di spedizione standard perciò non possono essere gratuite")
      end
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
