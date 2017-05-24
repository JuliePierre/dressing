class DressingItem < ApplicationRecord
  CATEGORY = %w(Robe Top Veste Pantalon Jupe Combinaison Blouse Manteau Chaussures Chapeau Pochette Bandeau Collier)

  has_attachments :photos, maximum: 3
  acts_as_votable

  belongs_to :user
  validates :category, inclusion: { in: CATEGORY, allow_blank: false }
end
