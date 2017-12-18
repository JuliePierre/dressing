class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.references :missing_item, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.string :ref

      t.timestamps
    end
  end
end
