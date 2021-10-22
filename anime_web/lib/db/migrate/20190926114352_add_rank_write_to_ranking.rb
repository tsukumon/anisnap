class AddRankWriteToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_write, :integer
  end
end
