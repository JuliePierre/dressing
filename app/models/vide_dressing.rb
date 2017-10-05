class VideDressing < ApplicationRecord
  STATUS = ["Public", "Privé"]

  has_attachment :photo

  belongs_to :user
  has_many :vide_dressing_items, dependent: :destroy

  validates :status, inclusion: { in: STATUS, allow_blank: false }
  validates :user, presence: true

  def marks_of_interest
    sum = 0
    all_users = User.all
    self.vide_dressing_items.each do |item|
      all_users.each do |user|
        if user.shopping_cart
          user.shopping_cart.shopping_cart_items.each do |shopping_cart_item|
            sum += 1 if item.id == shopping_cart_item.item_id
          end
        end
      end
    end
    return sum
  end
end
