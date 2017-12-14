class MissingItemPicture < ApplicationRecord
  belongs_to :missing_item

  mount_uploader :photo, PhotoUploader
end
