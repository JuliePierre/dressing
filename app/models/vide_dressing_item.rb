class VideDressingItem < ApplicationRecord
  CATEGORY = %w(Robe Top Veste Pantalon Jupe Combinaison Blouse Manteau Chaussures Chapeau Pochette Bandeau Collier)
  GENDER = ["Homme", "Femme"]

  has_attachments :photos, maximum: 4

  belongs_to :vide_dressing

  validates :category, inclusion: { in: CATEGORY, allow_blank: false }
  validates :gender, inclusion: { in: GENDER, allow_blank: false }
  validates :price, presence: true
end
