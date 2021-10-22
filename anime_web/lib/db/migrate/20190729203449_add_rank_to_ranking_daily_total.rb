class AddRankToRankingDailyTotal < ActiveRecord::Migration[5.2]
  def change
    add_column :ranking_daily_totals, :rank, :integer
  end
end
