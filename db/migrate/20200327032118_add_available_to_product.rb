class AddAvailableToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :available, :boolean, default: true
    add_monetize :products, :discounted_price, currency: { present: false }
  end
end
