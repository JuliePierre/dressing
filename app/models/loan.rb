class Loan < ApplicationRecord
  belongs_to :dressing_item
  belongs_to :user

  scope :status, -> (*statuses) { where status: statuses }
end
