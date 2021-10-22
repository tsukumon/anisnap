class AddRankVoiceWeeklyToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_voice_weekly, :integer
  end
end
