class CreateDeliveryInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_infos do |t|
      t.string :first_name
      t.string :las_name
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country
      t.text :notes
      t.string :email
      t.string :phone_prefix, default: '+39'
      t.references :order, null: false, foreign_key: true
      t.string :phone_number

      t.timestamps
    end
  end
end
