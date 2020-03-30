class AddMonetizeToCartProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :cart_products, :amount
    add_monetize :cart_products, :price # Rails 4x and above
  end
end
