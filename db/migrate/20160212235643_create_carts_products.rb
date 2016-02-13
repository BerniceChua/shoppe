class CreateCartsProducts < ActiveRecord::Migration
  def change
    create_table :carts_products do |t|
      t.references :cart
      t.references :product
      t.integer :quantity, null: false, default: 1

      t.timestamps null: false
    end
  end
end
