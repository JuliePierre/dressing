class RemoveMissingItemFromOutfits < ActiveRecord::Migration[5.0]
  def change
    remove_column :outfits, :missing_item
  end
end
