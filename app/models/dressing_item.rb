class DressingItem < ApplicationRecord
  CATEGORY = %w(Robe Top Veste Pantalon Jupe Combinaison Blouse Manteau Chaussures Chapeau Pochette Bandeau Collier)

  mount_uploader :photo, PhotoUploader
  belongs_to :user
  validates :category, inclusion: { in: CATEGORY, allow_blank: false }
end
