class CreateOutfits < ActiveRecord::Migration[5.0]
  def change
    create_table :outfits do |t|
      t.string :name
      t.string :occasion
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
