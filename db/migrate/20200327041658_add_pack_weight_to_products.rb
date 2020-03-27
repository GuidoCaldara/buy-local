class AddPackWeightToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :pack_weight, :integer
  end
end
