class DressingItemPicture < ApplicationRecord
  belongs_to :dressing_item

  mount_uploader :photo, PhotoUploader
end
