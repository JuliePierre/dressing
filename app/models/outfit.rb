class Outfit < ApplicationRecord
  ITEMS = %w(Chapeau Foulard Pochette Collier Bracelet)

  belongs_to :user
  has_and_belongs_to_many :missing_items
  has_attachment :photo

  validates :name, presence: true
end
