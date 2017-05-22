class Proposal < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  belongs_to :outfit
  belongs_to :missing_item

  validates :name, presence: true
end
