class Ceremony < ApplicationRecord
  belongs_to :user
  has_many :outfits, dependent: :destroy

  validates :name, uniqueness: true
end
