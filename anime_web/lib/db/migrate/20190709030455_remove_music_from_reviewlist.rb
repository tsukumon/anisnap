class RemoveMusicFromReviewlist < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviewlists, :music, :text
  end
end
