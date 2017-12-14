class AddColumnsToDressingItem < ActiveRecord::Migration[5.0]
  def change
    add_column :dressing_items, :to_sell, :boolean
    add_column :dressing_items, :to_lend, :boolean
    add_column :dressing_items, :to_rent, :boolean
  end
end
