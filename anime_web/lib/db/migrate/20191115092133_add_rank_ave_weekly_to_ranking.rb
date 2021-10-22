class AddRankAveWeeklyToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_ave_weekly, :integer
  end
end
