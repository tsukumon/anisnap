class RemoveSumFromReviewlist < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviewlists, :sum, :text
  end
end
