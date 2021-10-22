class AddRankReviewWeeklyToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_review_weekly, :integer
  end
end
