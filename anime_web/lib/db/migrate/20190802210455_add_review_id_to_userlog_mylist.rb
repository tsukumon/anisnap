class AddReviewIdToUserlogMylist < ActiveRecord::Migration[5.2]
  def change
    add_column :userlog_mylists, :review_id, :integer
  end
end
