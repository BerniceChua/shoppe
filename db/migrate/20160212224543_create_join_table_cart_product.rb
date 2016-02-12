class CreateJoinTableCartProduct < ActiveRecord::Migration
  def change
    create_join_table :carts, :products do |t|
      t.references :cart
      t.references :product
      # t.index [:product_id, :cart_id]
      t.integer :quantity

      t.timestamps null: false

    end
    add_index :carts_products, [:cart_id, :product_id]
  end
end
