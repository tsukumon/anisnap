class AddRankTotalToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_total, :integer
  end
end
