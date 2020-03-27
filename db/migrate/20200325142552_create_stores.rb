class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.text :description
      t.string :phone_number
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
