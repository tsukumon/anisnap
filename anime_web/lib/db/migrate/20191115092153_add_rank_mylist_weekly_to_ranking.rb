class AddRankMylistWeeklyToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_mylist_weekly, :integer
  end
end
