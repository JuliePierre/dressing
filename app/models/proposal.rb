class Proposal < ApplicationRecord
  belongs_to :missing_item
  belongs_to :user

  scope :user, -> (user) { where user_id: user.id }

  has_many :proposal_pictures
end
