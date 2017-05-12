class Ceremony < ApplicationRecord
  belongs_to :user
  has_many :outfits

  validates :name, uniqueness: true
end
