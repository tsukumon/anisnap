class AddRankWriteWeeklyToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_write_weekly, :integer
  end
end
