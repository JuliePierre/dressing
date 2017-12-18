class CreateProposalPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :proposal_pictures do |t|
      t.references :proposal, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
