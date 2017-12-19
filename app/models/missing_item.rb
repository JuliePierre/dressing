class MissingItem < ApplicationRecord

  belongs_to :user
  has_many :missing_item_pictures, dependent: :destroy
  has_many :missing_item_targets, dependent: :destroy
  has_many :proposals, dependent: :destroy

  scope :status, -> (status) { where status: status }
end
