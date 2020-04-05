class AddCartAmountToOrders < ActiveRecord::Migration[6.0]
  def change
    add_monetize :orders, :cart_amount, currency: { present: false }
    add_monetize :orders, :total_amount, currency: { present: false }
    remove_column :orders, :amount_cents
  end
end
