class AddColumnsToDressingItems < ActiveRecord::Migration[5.0]
  def change
    add_column :dressing_items, :brand, :string
    add_column :dressing_items, :ref, :string
  end
end
