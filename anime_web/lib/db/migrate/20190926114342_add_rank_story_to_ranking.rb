class AddRankStoryToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_story, :integer
  end
end
