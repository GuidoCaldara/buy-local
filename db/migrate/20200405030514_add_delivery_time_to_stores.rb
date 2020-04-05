class AddDeliveryTimeToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :delivery_time, :integer
  end
end
