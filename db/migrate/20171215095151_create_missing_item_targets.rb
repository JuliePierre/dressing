class CreateMissingItemTargets < ActiveRecord::Migration[5.0]
  def change
    create_table :missing_item_targets do |t|
      t.references :missing_item, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
