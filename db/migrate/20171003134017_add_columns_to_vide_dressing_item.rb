class AddColumnsToVideDressingItem < ActiveRecord::Migration[5.0]
  def change
    add_column :vide_dressing_items, :color, :string
    add_column :vide_dressing_items, :size, :string
  end
end
