class Proposal < ApplicationRecord
  has_attachments :photos, maximum: 3
  belongs_to :user
  belongs_to :outfit
  belongs_to :missing_item

  validates :name, presence: true
end
