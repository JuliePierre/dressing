class CreateMissingItemPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :missing_item_pictures do |t|
      t.string :photo
      t.references :missing_item, foreign_key: true

      t.timestamps
    end
  end
end
