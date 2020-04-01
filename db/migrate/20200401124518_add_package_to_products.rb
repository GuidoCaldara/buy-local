class AddPackageToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :package, null: false, foreign_key: true
  end
end
