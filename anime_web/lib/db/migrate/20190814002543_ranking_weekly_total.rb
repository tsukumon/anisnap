class RankingWeeklyTotal < ActiveRecord::Migration[5.2]
  def change
    drop_table :ranking_weekly_totals
  end
end
