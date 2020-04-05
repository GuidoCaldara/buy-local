class AddDeliveryFeeToOrders < ActiveRecord::Migration[6.0]
  def change
    add_monetize :orders, :delivery_fee, currency: { present: false }
  end
end
