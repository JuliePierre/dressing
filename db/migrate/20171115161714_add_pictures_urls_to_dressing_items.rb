class AddPicturesUrlsToDressingItems < ActiveRecord::Migration[5.0]
  def change
    add_column :dressing_items, :pictures_urls, :json
  end
end
