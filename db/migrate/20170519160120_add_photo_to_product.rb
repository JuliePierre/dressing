class AddPhotoToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :outfits, :photo, :string
  end
end
