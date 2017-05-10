class CreateJoinTableOutfitMissingItem < ActiveRecord::Migration[5.0]
  def change
    create_table :join_outfit_missing_items, id: false do |t|
      t.belongs_to :outfit, index: true
      t.belongs_to :missing_item, index: true
    end
  end
end
