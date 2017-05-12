class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.references :user, foreign_key: true
      t.references :outfit, foreign_key: true
      t.references :missing_item, foreign_key: true

      t.timestamps
    end
  end
end
