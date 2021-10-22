class RemoveStoryFromReviewlist < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviewlists, :story, :text
  end
end
