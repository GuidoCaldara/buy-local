class AddStripeIdToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :stripe_shop_id, :string
  end
end
