class AddRankReviewSeasonToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_review_season, :integer
  end
end
