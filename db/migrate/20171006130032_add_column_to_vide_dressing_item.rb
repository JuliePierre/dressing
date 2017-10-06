class AddColumnToVideDressingItem < ActiveRecord::Migration[5.0]
  def change
    add_column :vide_dressing_items, :description, :string
  end
end
