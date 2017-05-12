class Outfit < ApplicationRecord
  has_attachments :photos, maximum: 5
  acts_as_votable

  belongs_to :user
  has_and_belongs_to_many :missing_items

  validates :name, presence: true
end
