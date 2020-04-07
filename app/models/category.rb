class Category < ApplicationRecord
  CATEGORIES = ["Insaccati", "Frutta", "Verdura", "Formaggi", "Conserve", "Erbe", "Carne", "Pesce", "Pasta Fresca"]
  has_many :products

  validates :name, presence: true, inclusion: {in: CATEGORIES }
end
