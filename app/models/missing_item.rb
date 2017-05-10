class MissingItem < ApplicationRecord
  has_and_belongs_to_many :outfits
end
