class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, null: false
      t.boolean :active?, default: true
      t.decimal :total_price, :precision => 10, :scale => 2, default: 0

      t.timestamps null: false
    end
  end
end
