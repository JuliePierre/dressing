class AddColumnToFriendships < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :is_accepted, :boolean
  end
end
