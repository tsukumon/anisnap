class AddRankMusicToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_music, :integer
  end
end
