class CreateVideDressingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :vide_dressing_items do |t|
      t.references :vide_dressing, foreign_key: true
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
