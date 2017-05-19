class AddPhotoToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :photo, :string
  end
end
