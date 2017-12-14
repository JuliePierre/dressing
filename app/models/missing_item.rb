class MissingItem < ApplicationRecord

  belongs_to :user
  has_many :missing_item_pictures

  scope :status, -> (status) { where status: status }

end
