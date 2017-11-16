class DressingItem < ApplicationRecord
  CATEGORY = %w(Robe Top Veste Pantalon Jupe Combinaison Blouse Manteau Chaussures Chapeau Pochette Bandeau Collier)
  GENDER = ["male", "female"]

  mount_uploaders :photos, PhotoUploader


  belongs_to :user

  validates :category, inclusion: { in: CATEGORY, allow_blank: false }
  validates :gender, inclusion: { in: GENDER, allow_blank: false }
  validates :price, presence: true


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