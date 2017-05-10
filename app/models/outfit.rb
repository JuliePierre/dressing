class User < ApplicationRecord
  belongs_to :user
  has_attachment :photo
end
