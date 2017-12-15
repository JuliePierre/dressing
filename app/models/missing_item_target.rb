class MissingItemTarget < ApplicationRecord
  belongs_to :missing_item
  belongs_to :user
end
