class Product < ActiveRecord::Base
  before_save :default_inventory_is_one

  validates :title, :description, :price, presence: true
  validates :price, :inventory, numericality: {greater_than_or_equal_to: 0}

  def default_inventory_is_one
    if self.inventory.nil?
      self.inventory = 1
    end
  end

end
