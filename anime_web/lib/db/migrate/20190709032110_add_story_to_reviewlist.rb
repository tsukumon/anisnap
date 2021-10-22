class AddStoryToReviewlist < ActiveRecord::Migration[5.2]
  def change
    add_column :reviewlists, :story, :integer
  end
end
