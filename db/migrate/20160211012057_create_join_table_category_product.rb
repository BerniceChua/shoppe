class CreateJoinTableCategoryProduct < ActiveRecord::Migration
  def change
    create_join_table :categories, :products do |t|
      t.index [:category_id, :product_id]
      t.index [:product_id, :category_id]
      t.references :category
      t.references :product
      t.timestamps
    end
  end
end
