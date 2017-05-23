class MissingItem < ApplicationRecord
  CATEGORY = %w(Robe Top Veste Pantalon Jupe Combinaison Blouse Manteau Chaussures Chapeau Pochette Bandeau Collier)

  has_and_belongs_to_many :outfits
  has_many :proposals
end
