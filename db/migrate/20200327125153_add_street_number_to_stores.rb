class AddStreetNumberToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :street_number, :string
  end
end
