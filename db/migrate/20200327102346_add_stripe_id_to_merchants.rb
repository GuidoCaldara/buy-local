class AddStripeIdToMerchants < ActiveRecord::Migration[6.0]
  def change
    add_column :merchants, :stripe_merchant_id, :string
  end
end
