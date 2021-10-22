class AddMusicToReviewlist < ActiveRecord::Migration[5.2]
  def change
    add_column :reviewlists, :music, :integer
  end
end
