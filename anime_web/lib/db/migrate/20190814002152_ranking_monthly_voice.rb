class RankingMonthlyVoice < ActiveRecord::Migration[5.2]
  def change
    drop_table :ranking_monthly_voices
  end
end
