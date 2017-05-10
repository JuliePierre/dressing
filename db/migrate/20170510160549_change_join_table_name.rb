class ChangeJoinTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :join_outfit_missing_items, :missing_items_outfits
  end
end
