class AddRankVoiceSeasonToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_voice_season, :integer
  end
end
