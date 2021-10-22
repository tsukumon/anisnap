class AddRankCharaToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_chara, :integer
  end
end
