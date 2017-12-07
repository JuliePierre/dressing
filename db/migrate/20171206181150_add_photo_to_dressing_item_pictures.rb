class AddPhotoToDressingItemPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :dressing_item_pictures, :photo, :string
  end
end
