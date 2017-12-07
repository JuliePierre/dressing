class CreateDressingItemPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :dressing_item_pictures do |t|
      t.references :dressing_item, foreign_key: true

      t.timestamps
    end
  end
end
