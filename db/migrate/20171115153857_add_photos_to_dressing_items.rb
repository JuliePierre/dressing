class AddPhotosToDressingItems < ActiveRecord::Migration[5.0]
  def change
    add_column :dressing_items, :photos, :json
  end
end
