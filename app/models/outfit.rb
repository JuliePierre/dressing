class Outfit < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  acts_as_votable

  belongs_to :user
  belongs_to :ceremony
  has_and_belongs_to_many :missing_items
  has_many :proposals, dependent: :destroy

  validates :name, presence: true
end
