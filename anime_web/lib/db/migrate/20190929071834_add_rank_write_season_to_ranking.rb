class AddRankWriteSeasonToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_write_season, :integer
  end
end
