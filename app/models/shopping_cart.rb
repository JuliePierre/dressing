class ShoppingCart < ApplicationRecord
  acts_as_shopping_cart

  belongs_to :user
end
