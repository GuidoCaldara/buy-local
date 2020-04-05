class AddDeliveryCostsToStores < ActiveRecord::Migration[6.0]
  def change
    add_monetize :stores, :delivery_fee, currency: { present: false }
    add_monetize :stores, :free_delivery_threshold, currency: { present: false }
  end
end
