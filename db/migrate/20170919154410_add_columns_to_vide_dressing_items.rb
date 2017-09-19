class AddColumnsToVideDressingItems < ActiveRecord::Migration[5.0]
  def change
    add_column :vide_dressing_items, :price, :float
    add_column :vide_dressing_items, :gender, :string
  end
end
