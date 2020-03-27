class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :sold_by
      t.string :sku
      t.references :store, null: false, foreign_key: true
      t.timestamps
    end
  end
end
