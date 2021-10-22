class AddRankStorySeasonToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_story_season, :integer
  end
end
