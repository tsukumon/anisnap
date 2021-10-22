class AddRankMylistSeasonToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_mylist_season, :integer
  end
end
