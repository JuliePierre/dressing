class DressingItem < ApplicationRecord
  CATEGORIES = %w(Pantalon T-shirt Chemise Blouse Veste Pull Short Jupe Robe Manteau Chapeau Chaussures Accessoire).sort
  GENDER = ["male", "female"]
  COLORS = %w(Noir Blanc Bleu Rouge Orange Vert Gris Violet Jaune Marron Rose).sort
  COLORTRANSLATION = {
    "noir": "black",
    "blanc": "white",
    "bleu": "blue",
    "rouge": "red",
    "orange": "orange",
    "vert": "green",
    "gris": "grey",
    "violet": "purple",
    "jaune": "yellow",
    "marron": "brown",
    "rose": "pink",
    "autre": "transparent"
  }
  SIZES_OPTION1 = %w(34 36 38 40 42 44 46 48)
  SIZES_OPTION2 = %w(XXS XS S M L XL XXL)

  belongs_to :user
  has_many :dressing_item_pictures

  validates :category, inclusion: { in: CATEGORIES, allow_blank: false }
  validates :gender, inclusion: { in: GENDER, allow_blank: false }
  validates :price, presence: true

  scope :gender, -> (*genders) { where gender: genders }
  scope :category, -> (*categories) { where category: categories }

  def users_interested
    users_interested = []
    all_users = User.all
    all_users.each do |user|
      if user.shopping_cart
        user.shopping_cart.shopping_cart_items.each do |item|
          users_interested << user if item.item_id == self.id
        end
      end
    end
    return users_interested
  end

  def is_in_cart?(user)
    return user.shopping_cart.shopping_cart_items.include?(self)
  end
end
