class AddColumnToOutfit < ActiveRecord::Migration[5.0]
  def change
    add_column :outfits, :missing_item, :text, :array => true
  end
end
