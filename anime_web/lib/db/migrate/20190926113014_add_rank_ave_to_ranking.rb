class AddRankAveToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_ave, :integer
  end
end
