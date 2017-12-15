class MissingItem < ApplicationRecord



  belongs_to :user
  has_many :missing_item_pictures
  has_many :missing_item_targets

  scope :status, -> (status) { where status: status }
end
