class AddRankTotalSeasonToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_total_season, :integer
  end
end
