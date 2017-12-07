class CreateDressingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :dressing_items do |t|
      t.string :name
      t.string :category
      t.float :price
      t.string :gender
      t.string :color
      t.string :size
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
