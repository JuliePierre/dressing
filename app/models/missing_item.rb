class MissingItem < ApplicationRecord
  ITEMS = %w(Chapeau Foulard Pochette Collier Bracelet)

  has_and_belongs_to_many :outfits
  has_many :proposals
end
