class Product < ApplicationRecord
  include PgSearch::Model
  monetize :price_cents
  monetize :discounted_price_cents
  has_one_attached :photo
  belongs_to :store
  has_one :merchant, through: :store
  belongs_to :package
  belongs_to :category
  pg_search_scope :product_search,
                against: [:name, :description],
                using: {
                  tsearch: { prefix: true , dictionary: "italian" }
                }
  validates :name, presence: true, length: { minimum: 5, maximum: 40 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :sku, presence: true, length: { minimum: 5, maximum: 10 }, uniqueness: { scope: :store_id }
  validates :price_cents, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 40000 }
  validates :discounted_price_cents, numericality: { only_integer: true, greater_or_equal_than: 0, less_than: 40000 }, allow_blank: true
  validate :discounted_price_is_bigger_than_normal_price
  validates :pack_weight, numericality: { only_integer: true, greater_than: 0, less_than: 40000 }, allow_blank: true
  validate :pack_weight_present

  def pack_weight_present
    if self.package_id && ["box","jar","piece"].include?(Package.find(self.package_id).name) && self.pack_weight.blank?
      errors.add(:pack_weight, "Aggiungi il peso in grammi")
    end
  end

  def discounted_price_is_bigger_than_normal_price
    return if self.discounted_price_cents == 0
    if self.discounted_price_cents >= self.price_cents
      errors.add(:discounted_price_cents, "Il prezzo scontato deve essere inferiore al prezzo normale")
    end
  end


  def on_sale?
    self.discounted_price_cents != 0
  end
end
