class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :outfit
  belongs_to :missing_item
  has_attachments :photos, maximum: 2
end
