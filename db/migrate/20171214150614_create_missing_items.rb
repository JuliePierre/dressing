class CreateMissingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :missing_items do |t|
      t.string :name
      t.text :description
      t.string :ref
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
