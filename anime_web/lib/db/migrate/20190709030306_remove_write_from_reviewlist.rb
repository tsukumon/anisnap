class RemoveWriteFromReviewlist < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviewlists, :write, :text
  end
end
