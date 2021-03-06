class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories

  before_save :default_inventory_is_one

  validates :title, :description, :price, presence: true
  validates :price, :inventory, numericality: {greater_than_or_equal_to: 0}
  # validate :must_have_at_least_one_category

  def default_inventory_is_one
    if self.inventory.nil?
      self.inventory = 1
    end
  end

  # def must_have_at_least_one_category
  # 	if self.categories.length < 1
  # 		errors.add(:product, "must have at least one category")
  # 	end
  # end

  def find_cart(cart)
    CartsProduct.find_by(cart_id: cart.id, product_id: self.id)
  end

  def reduce_inventory_after_checkout(quantity)
    self.update_attributes(inventory: self.inventory -= quantity)
  end

  def calculate_quantity(cart)
    find_cart(cart).quantity
  end



  def categories_list
    array_of_categories = []
    self.categories.each do |category|
      array_of_categories << "#{category.name}"
    end
    return array_of_categories.join(", ")
  end

end
