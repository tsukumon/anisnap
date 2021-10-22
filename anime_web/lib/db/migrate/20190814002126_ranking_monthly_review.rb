class RankingMonthlyReview < ActiveRecord::Migration[5.2]
  def change
    drop_table :ranking_monthly_reviews
  end
end
