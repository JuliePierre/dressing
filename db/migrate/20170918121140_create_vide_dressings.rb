class CreateVideDressings < ActiveRecord::Migration[5.0]
  def change
    create_table :vide_dressings do |t|
      t.references :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
