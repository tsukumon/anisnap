class RankingWeeklyVoice < ActiveRecord::Migration[5.2]
  def change
    drop_table :ranking_weekly_voices
  end
end
