class VideDressingItem < ApplicationRecord
  CATEGORY = %w(Robe Top Veste Pantalon Jupe Combinaison Blouse Manteau Chaussures Chapeau Pochette Bandeau Collier)

  belongs_to :vide_dressing
  has_attachments :photos, maximum: 3
  validates :category, inclusion: { in: CATEGORY, allow_blank: false }
end
