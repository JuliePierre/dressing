class AddColumnToOutfits < ActiveRecord::Migration[5.0]
  def change
    add_column :outfits, :ceremony_id, :integer
  end
end
