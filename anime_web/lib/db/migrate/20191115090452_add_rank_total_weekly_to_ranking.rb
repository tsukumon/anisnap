class AddRankTotalWeeklyToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_total_weekly, :integer
  end
end
