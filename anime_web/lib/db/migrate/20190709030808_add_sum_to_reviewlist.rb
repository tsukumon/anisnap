class AddSumToReviewlist < ActiveRecord::Migration[5.2]
  def change
    add_column :reviewlists, :sum, :integer
  end
end
