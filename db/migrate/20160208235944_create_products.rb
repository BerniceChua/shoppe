class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
       t.decimal :price, :precision => 10, :scale => 2, default: 0
      t.string :description
      t.integer :inventory, default: 1
      t.string :picture

      t.timestamps null: false
    end
  end
end
