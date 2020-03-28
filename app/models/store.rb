class Store < ApplicationRecord
  belongs_to :merchant
  has_many :products
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.street_changed? }

  def full_address
    [street, street_number, city, state, country].compact.join(', ')
  end
end
