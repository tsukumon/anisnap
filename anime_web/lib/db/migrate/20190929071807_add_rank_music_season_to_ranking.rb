class AddRankMusicSeasonToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_music_season, :integer
  end
end
