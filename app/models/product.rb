class Product < ApplicationRecord
  include PgSearch::Model
  monetize :price_cents
  monetize :discounted_price_cents
  has_one_attached :photo
  belongs_to :store
  belongs_to :category
  pg_search_scope :product_search,
                against: [:name, :description],
                using: {
                  tsearch: { prefix: true , dictionary: "italian" }
                }

end
