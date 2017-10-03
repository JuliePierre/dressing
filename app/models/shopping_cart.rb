class ShoppingCart < ApplicationRecord
  acts_as_shopping_cart

  belongs_to :user

  def cart_price
    sum = 0
    self.shopping_cart_items.each do |item|
      sum += item.price
    end
    return sum
  end
end
