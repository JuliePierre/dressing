class AddColumnToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :name, :string
  end
end
