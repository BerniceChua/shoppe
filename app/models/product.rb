class Product < ActiveRecord::Base
  before_save :nil_inventory_is_zero

  validates :title, :description, :price, presence: true

  def nil_inventory_is_zero
    if self.inventory.nil?
      self.inventory = 0
    end
  end

end
