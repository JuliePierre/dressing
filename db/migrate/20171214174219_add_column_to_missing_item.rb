class AddColumnToMissingItem < ActiveRecord::Migration[5.0]
  def change
    add_column :missing_items, :status, :string
  end
end
