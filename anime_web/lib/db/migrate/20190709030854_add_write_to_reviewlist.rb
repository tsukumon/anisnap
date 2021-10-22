class AddWriteToReviewlist < ActiveRecord::Migration[5.2]
  def change
    add_column :reviewlists, :write, :integer
  end
end
