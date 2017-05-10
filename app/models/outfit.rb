class Outfit < ApplicationRecord
  belongs_to :user
  has_attachment :photo

  validates :name, presence: true
end
