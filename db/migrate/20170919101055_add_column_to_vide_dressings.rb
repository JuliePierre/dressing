class AddColumnToVideDressings < ActiveRecord::Migration[5.0]
  def change
    add_column :vide_dressings, :status, :string
  end
end
