class AddRankCharaWeeklyToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_chara_weekly, :integer
  end
end
