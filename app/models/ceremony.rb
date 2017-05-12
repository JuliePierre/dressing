class Ceremony < ApplicationRecord
  belongs_to :user
  has_many :outfits
end
