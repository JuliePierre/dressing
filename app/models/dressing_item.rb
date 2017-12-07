class DressingItem < ApplicationRecord
  CATEGORY = %w(Robe Top Veste Pantalon Jupe Combinaison Blouse Manteau Chaussures Chapeau Pochette Bandeau Collier)
  GENDER = ["male", "female"]

  belongs_to :user
  has_many :dressing_item_pictures

  validates :category, inclusion: { in: CATEGORY, allow_blank: false }
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
end
