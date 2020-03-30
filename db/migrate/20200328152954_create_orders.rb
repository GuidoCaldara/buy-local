class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :cart, null: false, foreign_key: true
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
