class AddPhotoToDressingItem < ActiveRecord::Migration[5.0]
  def change
    add_column :dressing_items, :photo, :string
  end
end
