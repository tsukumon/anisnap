class RankingDailyMusic < ActiveRecord::Migration[5.2]
  def change
    drop_table :ranking_daily_musics
  end
end
