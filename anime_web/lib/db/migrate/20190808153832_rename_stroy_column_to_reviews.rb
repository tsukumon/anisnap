class RenameStroyColumnToReviews < ActiveRecord::Migration[5.2]
  def change
     rename_column :rankings, :score_stroy, :score_story
  end
end
