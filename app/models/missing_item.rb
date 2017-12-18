class MissingItem < ApplicationRecord

  belongs_to :user
  has_many :missing_item_pictures
  has_many :missing_item_targets
  has_many :proposals

  scope :status, -> (status) { where status: status }
end
