class VideDressing < ApplicationRecord
  STATUS = ["Public", "Privé"]

  belongs_to :user
  has_many :vide_dressing_items

  validates :status, inclusion: { in: STATUS, allow_blank: false }
  validates :user, presence: true
end
