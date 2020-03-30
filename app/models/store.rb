class Store < ApplicationRecord
  belongs_to :merchant
  has_many :products
  has_many :categories, through: :products
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.street_changed? }

  def categories_name
    self.categories.pluck(:name).uniq
  end

  def full_address
    [street, street_number, city, state, country].compact.join(', ')
  end
end
