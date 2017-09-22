class VideDressing < ApplicationRecord
  STATUS = ["Public", "Privé"]

  has_attachment :photo

  belongs_to :user
  has_many :vide_dressing_items, dependent: :destroy

  validates :status, inclusion: { in: STATUS, allow_blank: false }
  validates :user, presence: true
end
