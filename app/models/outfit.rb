class Outfit < ApplicationRecord
  has_attachment :photo
  acts_as_votable

  belongs_to :user
  has_and_belongs_to_many :missing_items

  validates :name, presence: true
end
