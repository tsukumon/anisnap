class RankingDailyVoice < ActiveRecord::Migration[5.2]
  def change
    drop_table :ranking_daily_voices
  end
end
