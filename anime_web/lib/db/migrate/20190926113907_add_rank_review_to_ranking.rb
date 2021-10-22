class AddRankReviewToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_review, :integer
  end
end
