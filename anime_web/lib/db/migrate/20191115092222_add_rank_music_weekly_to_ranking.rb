class AddRankMusicWeeklyToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_music_weekly, :integer
  end
end
