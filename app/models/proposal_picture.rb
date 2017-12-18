class ProposalPicture < ApplicationRecord
  belongs_to :proposal

  mount_uploader :photo, PhotoUploader
end
