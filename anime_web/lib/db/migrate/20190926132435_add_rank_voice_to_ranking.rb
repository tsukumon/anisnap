class AddRankVoiceToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_voice, :integer
  end
end
