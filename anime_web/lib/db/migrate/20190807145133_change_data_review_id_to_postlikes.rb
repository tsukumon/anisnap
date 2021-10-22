class ChangeDataReviewIdToPostlikes < ActiveRecord::Migration[5.2]
  def change
    change_column  :postlikes,:review_id, :integer
  end
end
