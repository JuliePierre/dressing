class VideDressing < ApplicationRecord
  belongs_to :user
  has_many :vide_dressing_items
end
