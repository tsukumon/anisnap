class RemoveStroyFromReviewlist < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviewlists, :stroy, :text
  end
end
