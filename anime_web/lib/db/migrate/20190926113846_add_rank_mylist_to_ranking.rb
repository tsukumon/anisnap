class AddRankMylistToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_mylist, :integer
  end
end
